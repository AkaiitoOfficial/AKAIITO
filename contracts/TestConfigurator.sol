pragma solidity 0.4.18;

import './ownership/Ownable.sol';

contract AICToken {
  function setSaleAgent(address newSaleAgnet) public;
  function transferOwnership(address newOwner) public;
}

contract Presale {
  function setWallet(address newWallet) public;
  function setStart(uint newStart) public;
  function setPeriod(uint newPeriod) public;
  function setPrice(uint newPrice) public;
  function setHardcap(uint newHardcap) public;
  function setMainsale(address newMainsale) public;
  function addValueBonus(uint from, uint bonus) public;
  function setReferalsMinInvestLimit(uint newRefereralsMinInvestLimit) public;
  function setRefererPercent(uint newRefererPercent) public;
  function setMinInvestedLimit(uint newMinInvestedLimit) public;
  function setToken(address newToken) public;
  function transferOwnership(address newOwner) public;
}

contract Mainsale {
  function addMilestone(uint period, uint bonus) public;
  function setPrice(uint newPrice) public;
  function setWallet(address newWallet) public;
  function setFoundersTokensWallet(address newFoundersTokensWallet) public;
  function setMarketingTokensWallet(address newMarketingTokensWallet) public;
  function setBountyTokensWallet(address newBountyTokensWallet) public;
  function setStart(uint newStart) public;
  function setHardcap(uint newHardcap) public;
  function setFoundersTokensPercent(uint newFoundersTokensPercent) public;
  function setMarketingTokensPercent(uint newMarketingTokensPercent) public;
  function setBountyTokensPercent(uint newBountyTokensPercent) public;
  function addValueBonus(uint from, uint bonus) public;
  function setReferalsMinInvestLimit(uint newRefereralsMinInvestLimit) public;
  function setRefererPercent(uint newRefererPercent) public;
  function setMinInvestedLimit(uint newMinInvestedLimit) public;
  function setToken(address newToken) public;
  function transferOwnership(address newOwner) public;
}

contract TestConfigurator is Ownable {

  function deploy(address _token, address _presale, address _mainsale) public onlyOwner {
    AICToken token = AICToken(_token);
    Presale presale = Presale(_presale);
    Mainsale mainsale = Mainsale(_mainsale);

    presale.setWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A03);
    presale.setStart(1516053600);
    presale.setPeriod(14);
    presale.setPrice(1600000000000000000000);
    presale.setHardcap(5000000000000000000);
    presale.setMainsale(_mainsale);
    presale.addValueBonus(1000000000000000000, 3);
    presale.addValueBonus(1510000000000000000, 5);
    presale.addValueBonus(2010000000000000000, 8);
    presale.addValueBonus(3010000000000000000, 10);
    presale.addValueBonus(10010000000000000000, 15);
    presale.addValueBonus(15010000000000000000, 20);
    presale.setReferalsMinInvestLimit(100000000000000000);
    presale.setRefererPercent(2);
    presale.setMinInvestedLimit(10000000000000000);
    presale.setToken(_token);
    presale.transferOwnership(owner);

    mainsale.addMilestone(2, 40);
    mainsale.addMilestone(7, 30);
    mainsale.addMilestone(7, 20);
    mainsale.addMilestone(7, 10);
    mainsale.addMilestone(7, 5);
    mainsale.addMilestone(7, 0);
    mainsale.setPrice(1000000000000000000000);
    mainsale.setWallet(0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4);
    mainsale.setFoundersTokensWallet(0x796b57f96cb7661654981032a5f53047a560e3e0);
    mainsale.setMarketingTokensWallet(0xDa67155b22973bE05Bcd28c07107b2E17314A1e2);
    mainsale.setBountyTokensWallet(0xA0B1Bd7827C070F29b5aBa47e7B73FF4EfA00a57);
    mainsale.setStart(1516053600);
    mainsale.setHardcap(5000000000000000000);
    mainsale.setFoundersTokensPercent(15);
    mainsale.setMarketingTokensPercent(8);
    mainsale.setBountyTokensPercent(2);
    mainsale.addValueBonus(1000000000000000000, 3);
    mainsale.addValueBonus(1510000000000000000, 5);
    mainsale.addValueBonus(2010000000000000000, 8);
    mainsale.addValueBonus(3010000000000000000, 10);
    mainsale.addValueBonus(10010000000000000000, 15);
    mainsale.addValueBonus(15010000000000000000, 20);
    mainsale.setReferalsMinInvestLimit(100000000000000000);
    mainsale.setRefererPercent(2);
    mainsale.setMinInvestedLimit(10000000000000000);
    mainsale.setToken(_token);
    mainsale.transferOwnership(owner);

    token.setSaleAgent(_presale);
    token.transferOwnership(owner);
  }

}
