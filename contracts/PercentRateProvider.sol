pragma solidity 0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract PercentRateProvider is Ownable {

  uint public percentRate = 100;

  function setPercentRate(uint newPercentRate) public onlyOwner {
    percentRate = newPercentRate;
  }
 
}

