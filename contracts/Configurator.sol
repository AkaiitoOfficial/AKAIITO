pragma solidity 0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

import './AICToken.sol';
import './Presale.sol';
import './Mainsale.sol';

contract Configurator is Ownable {

  AICToken public token; 

  Presale public presale;

  Mainsale public mainsale;

  function deploy() public onlyOwner {
    //owner = 0x95EA6A4ec9F80436854702e5F05d238f27166A03;

    token = new AICToken();

    presale = new Presale();

    presale.setToken(token);
    presale.setWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A03);
    presale.setStart(1518393600);
    presale.setPeriod(14);
    presale.setMinInvestedLimit(10000000000000000);
    presale.setPrice(1600000000000000000000);
    presale.setHardcap(100000000000000000000);
    presale.addValueBonus(100000000000000000000, 3);
    presale.addValueBonus(151000000000000000000, 5);
    presale.addValueBonus(201000000000000000000, 8);
    presale.addValueBonus(301000000000000000000, 10);
    presale.addValueBonus(1001000000000000000000, 15);
    presale.addValueBonus(1501000000000000000000, 20);
    token.setSaleAgent(presale);	

    mainsale = new Mainsale();

    mainsale.setToken(token);
    mainsale.addMilestone(2, 40);
    mainsale.addMilestone(7, 30);
    mainsale.addMilestone(7, 20);
    mainsale.addMilestone(7, 10);
    mainsale.addMilestone(7, 5);
    mainsale.addMilestone(7, 0);
    mainsale.setPrice(1000000000000000000000);
    mainsale.setWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A03);
    mainsale.setFoundersTokensWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A05);
    mainsale.setMarketingTokensWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A05);
    mainsale.setBountyTokensWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A04);
    mainsale.setStart(1520640000);
    mainsale.setMinInvestedLimit(10000000000000000);
    mainsale.setHardcap(20000000000000000000000);
    mainsale.setFoundersTokensPercent(15);
    mainsale.setMarketingTokensPercent(8);
    mainsale.setBountyTokensPercent(2);
    mainsale.addValueBonus(100000000000000000000, 3);
    mainsale.addValueBonus(151000000000000000000, 5);
    mainsale.addValueBonus(201000000000000000000, 8);
    mainsale.addValueBonus(301000000000000000000, 10);
    mainsale.addValueBonus(1001000000000000000000, 15);
    mainsale.addValueBonus(1501000000000000000000, 20);

    presale.setMainsale(mainsale);

    token.transferOwnership(owner);
    presale.transferOwnership(owner);
    mainsale.transferOwnership(owner);
  }

}

