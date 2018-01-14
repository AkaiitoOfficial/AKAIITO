pragma solidity 0.4.18;

import './AICCommonSale.sol';
import './Mainsale.sol';

contract Presale is AICCommonSale {

  Mainsale public mainsale;

  uint public period;

  function calculateTokens(uint _invested) internal returns(uint) {
    uint tokens = _invested.mul(price).div(1 ether);
    return tokens.add(getValueBonusTokens(tokens));
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
    return start.add(period * 1 days);
  }

}
