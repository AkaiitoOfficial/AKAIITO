pragma solidity 0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

import './XCOINToken.sol';
import './Presale.sol';
import './Mainsale.sol';

contract Configurator is Ownable {

  XCOINToken public token; 

  Presale public presale;

  Mainsale public mainsale;

  function deploy() public onlyOwner {
    //owner = 0x95EA6A4ec9F80436854702e5F05d238f27166A03;

    token = new XCOINToken();

    presale = new Presale();

    presale.setToken(token);
    presale.setWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A03);
    presale.setStart(1517317200);
    presale.setPeriod(14);
    presale.setMinInvestedLimit(100000000000000000);
    presale.setPrice(1600000000000000000000);
    presale.setHardcap(100000000000000000000);
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
    mainsale.setAdvertiseTokensWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A05);
    mainsale.setBountyTokensWallet(0x95EA6A4ec9F80436854702e5F05d238f27166A04);
    mainsale.setStart(1525352400);
    mainsale.setMinInvestedLimit(10000000000000000);
    mainsale.setHardcap(20000000000000000000000);
    mainsale.setFoundersTokensPercent(15);
    mainsale.setAdvertiseTokensPercent(7);
    mainsale.setBountyTokensPercent(3);

    presale.setMainsale(mainsale);

    token.transferOwnership(owner);
    presale.transferOwnership(owner);
    mainsale.transferOwnership(owner);
  }

}

