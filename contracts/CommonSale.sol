pragma solidity 0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './XCOINToken.sol';

contract CommonSale is Ownable {

  using SafeMath for uint;

  address public wallet;

  address public directMintAgent;

  uint public percentRate = 100;

  uint public price;

  uint public start;

  uint public minInvestedLimit;

  XCOINToken public token;

  uint public hardcap;

  uint public invested;

  modifier isUnderHardcap() {
    require(invested < hardcap);
    _;
  }

  function setHardcap(uint newHardcap) public onlyOwner {
    hardcap = newHardcap;
  }
  
  modifier onlyDirectMintAgentOrOwner() {
    require(directMintAgent == msg.sender || owner == msg.sender);
    _;
  }

  modifier minInvestLimited(uint value) {
    require(value >= minInvestedLimit);
    _;
  }
  
  function setStart(uint newStart) public onlyOwner {
    start = newStart;
  }

  function setMinInvestedLimit(uint newMinInvestedLimit) public onlyOwner {
    minInvestedLimit = newMinInvestedLimit;
  }

  function setDirectMintAgent(address newDirectMintAgent) public onlyOwner {
    directMintAgent = newDirectMintAgent;
  }
  
  function setWallet(address newWallet) public onlyOwner {
    wallet = newWallet;
  }

  function setPrice(uint newPrice) public onlyOwner {
    price = newPrice;
  }

  function setToken(address newToken) public onlyOwner {
    token = XCOINToken(newToken);
  }

  function calculateTokens(uint _invested) internal returns(uint);

  function mintTokens(address to, uint tokens) public onlyDirectMintAgentOrOwner {
    token.mint(this, tokens);
    token.transfer(to, tokens);
  }

  function endSaleDate() public view returns(uint);

  function mintTokensByETH(address to, uint _invested) public onlyDirectMintAgentOrOwner isUnderHardcap {
    invested = invested.add(_invested);
    mintTokens(to, calculateTokens(_invested));
  }

  function () public payable minInvestLimited(msg.value) {
    require(now >= start && now < endSaleDate());
    wallet.transfer(msg.value);
    mintTokensByETH(msg.sender, msg.value);
  }
  
}

