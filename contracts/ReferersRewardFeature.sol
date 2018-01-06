pragma solidity 0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './PercentRateProvider.sol';
import './TokenMintInterface.sol';

contract ReferersRewardFeature is InputAddressFeature, CommonSale {

  uint public referersPercent;

  function setReferersPercent(uint newReferersPercent) public onlyOwner {
    referersPercent = newReferersPercent;
  }

  function calculateRefererValue(address excludedAddress, uint tokens) internal pure returns(address, uint) {
    if(msg.data.length == 20) {
      address referer = bytesToAddres(bytes(msg.data));
      require(referer != excludedAddress && referer != msg.sender);
      return (referer, tokens.mul(refererPercent).div(percentRate));
    } 
    return (0x0, 0);
  }

  function () public payable returns(uint) {
    uint tokens = super.();
    address referer = getRefererAddress();
    require(referer != token && referer != msg.sender);
    if(referer != address(0)) {
      mint(referer, tokens.mul(referersPercent).div(percentRate));
    }
  }

}
