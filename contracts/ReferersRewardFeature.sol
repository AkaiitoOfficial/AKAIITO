pragma solidity 0.4.18;

import './CommonSale.sol';
import './InputAddressFeature.sol';

contract ReferersRewardFeature is InputAddressFeature, CommonSale {

  uint public refererPercent;

  function setRefererPercent(uint newRefererPercent) public onlyOwner {
    refererPercent = newRefererPercent;
  }

  function fallback() internal returns(uint) {
    uint tokens = super.fallback();
    address referer = getInputAddress();
    if(referer != address(0)) {
      require(referer != address(token) && referer != msg.sender && referer != address(this));
      mintTokens(referer, tokens.mul(refererPercent).div(percentRate));
    }
    return tokens;
  }

}

