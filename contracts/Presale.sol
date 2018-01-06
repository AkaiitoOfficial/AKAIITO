pragma solidity 0.4.18;

import './CommonSale.sol';
import './Mainsale.sol';

contract Presale is CommonSale {

  Mainsale public mainsale;

  uint public period;

  function calculateTokens(uint _invested) internal returns(uint) {
    return _invested.mul(price).div(1 ether);
  }

  function setPeriod(uint newPeriod) public onlyOwner {
    period = newPeriod;
  }

  function setMainsale(address newMainsale) public onlyOwner {
    mainsale = Mainsale(newMainsale);
  }

  function finish() public onlyOwner {
    token.setSaleAgent(mainsale);
  }

  function endSaleDate() public view returns(uint) {
    return start.add(period);
  }

}
