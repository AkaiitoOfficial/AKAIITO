pragma solidity 0.4.18;

import './ownership/Ownable.sol';

contract InputAddressFeature {

  function bytesToAddress(bytes source) internal pure returns(address) {
    uint result;
    uint mul = 1;
    for(uint i = 20; i > 0; i--) {
      result += uint8(source[i-1])*mul;
      mul = mul*256;
    }
    return address(result);
  }

  function getInputAddress() internal pure returns(address) {
    if(msg.data.length == 20) {
      return bytesToAddress(bytes(msg.data));
    }
    return address(0);
  }

}
