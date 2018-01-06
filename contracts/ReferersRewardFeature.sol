pragma solidity 0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './PercentRateProvider.sol';

contract ReferersRewardFeature is PercentRateProvider, Ownable {

  uint public refererPercent;

  function setRefererPercent(uint newRefrerPercent) public onlyOwner {
    refererPercent = newRefererPercent;
  }

  function bytesToAddress(bytes source) internal pure returns(address) {
    uint result;
    uint mul = 1;
    for(uint i = 20; i > 0; i--) {
      result += uint8(source[i-1])*mul;
      mul = mul*256;
    }
    return address(result);
  }

  function calculateRefererValue(address excludedAddress, uint tokens) internal pure returns(address, uint) {
    if(msg.data.length == 20) {
      address referer = bytesToAddres(bytes(msg.data));
      require(referer != excludedAddress && referer != msg.sender);
      return (referer, tokens.mul(refererPercent).div(percentRate));
    } 
    return (0x0, 0);
  }

}
