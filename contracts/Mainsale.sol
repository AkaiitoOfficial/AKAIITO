pragma solidity 0.4.18;

import './CommonSale.sol';
import './StagedCrowdsale.sol';

contract Mainsale is StagedCrowdsale, CommonSale {

  address public foundersTokensWallet;
  
  address public advertiseTokensWallet;
  
  address public bountyTokensWallet;
  
  uint public foundersTokensPercent;

  uint public advertiseTokensPercent;
  
  uint public bountyTokensPercent;
  
  function setFoundersTokensPercent(uint newFoundersTokensPercent) public onlyOwner {
    foundersTokensPercent = newFoundersTokensPercent;
  }

  function setAdvertiseTokensPercent(uint newAdvertiseTokensPercent) public onlyOwner {
    advertiseTokensPercent = newAdvertiseTokensPercent;
  }

  function setBountyTokensPercent(uint newBountyTokensPercent) public onlyOwner {
    bountyTokensPercent = newBountyTokensPercent;
  }

  function setFoundersTokensWallet(address newFoundersTokensWallet) public onlyOwner {
    foundersTokensWallet = newFoundersTokensWallet;
  }

  function setAdvertiseTokensWallet(address newAdvertiseTokensWallet) public onlyOwner {
    advertiseTokensWallet = newAdvertiseTokensWallet;
  }

  function setBountyTokensWallet(address newBountyTokensWallet) public onlyOwner {
    bountyTokensWallet = newBountyTokensWallet;
  }

  function calculateTokens(uint _invested) internal returns(uint) {
    uint milestoneIndex = currentMilestone(start);
    Milestone storage milestone = milestones[milestoneIndex];
    uint tokens = _invested.mul(price).div(1 ether);
    if(milestone.bonus > 0) tokens = tokens.add(tokens.mul(milestone.bonus).div(percentRate));
    return tokens;
  }

  function finish() public onlyOwner {
    uint summaryTokensPercent = bountyTokensPercent.add(foundersTokensPercent).add(advertiseTokensPercent);
    uint mintedTokens = token.totalSupply();
    uint allTokens = mintedTokens.mul(percentRate).div(percentRate.sub(summaryTokensPercent));
    uint foundersTokens = allTokens.mul(foundersTokensPercent).div(percentRate);
    uint advertiseTokens = allTokens.mul(advertiseTokensPercent).div(percentRate);
    uint bountyTokens = allTokens.mul(bountyTokensPercent).div(percentRate);
    mintTokens(foundersTokensWallet, foundersTokens); 
    mintTokens(advertiseTokensWallet, advertiseTokens); 
    mintTokens(bountyTokensWallet, bountyTokens); 
    token.finishMinting();
  }

  function endSaleDate() public view returns(uint) {
    return lastSaleDate(start);    
  }

}
