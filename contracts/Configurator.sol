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

    presale.setWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A03);
    presale.setStart(1518393600);
    presale.setPeriod(14);
    presale.setPrice(1600000000000000000000);
    presale.setHardcap(100000000000000000000);
    token.setSaleAgent(presale);	
    commonConfigure(presale, token);

    mainsale = new Mainsale();

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
    mainsale.setHardcap(20000000000000000000000);
    mainsale.setFoundersTokensPercent(15);
    mainsale.setMarketingTokensPercent(8);
    mainsale.setBountyTokensPercent(2);
    commonConfigure(mainsale, token);

    presale.setMainsale(mainsale);

    token.transferOwnership(owner);
    presale.transferOwnership(owner);
    mainsale.transferOwnership(owner);
  }

  function commonConfigure(address saleAddress, address _token) internal {
     AICCommonSale sale = AICCommonSale(saleAddress);
     sale.addValueBonus(100000000000000000000, 3);
     sale.addValueBonus(151000000000000000000, 5);
     sale.addValueBonus(201000000000000000000, 8);
     sale.addValueBonus(301000000000000000000, 10);
     sale.addValueBonus(1001000000000000000000, 15);
     sale.addValueBonus(1501000000000000000000, 20);
     sale.setReferalsMinInvestLimit(10000000000000000000);
     sale.setRefererPercent(2);
     sale.setMinInvestedLimit(10000000000000000);
     sale.setToken(_token);
  }

}

