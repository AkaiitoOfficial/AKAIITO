pragma solidity 0.4.18;

import './ReferersRewardFeature.sol';

contract XCOINCommonSale is RetreiveTokensFeature, ReferersRewardFeature, CommonSale {

  function () public payable returns(uint) {
    uint tokens = super.();
    uint (referer, refererTokens) = calculateRefererValue(token, tokens);
    if(refererTokens > 0) mint(referer, refererTokens);
  }
  
}

