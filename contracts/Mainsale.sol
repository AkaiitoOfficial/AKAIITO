pragma solidity 0.4.18;

import './AICCommonSale.sol';
import './StagedCrowdsale.sol';

contract Mainsale is StagedCrowdsale, AICCommonSale {

  address public foundersTokensWallet;
  
  address public marketingTokensWallet;
  
  address public bountyTokensWallet;
  
  uint public foundersTokensPercent;

  uint public marketingTokensPercent;
  
  uint public bountyTokensPercent;
  
  function setFoundersTokensPercent(uint newFoundersTokensPercent) public onlyOwner {
    foundersTokensPercent = newFoundersTokensPercent;
  }

  function setMarketingTokensPercent(uint newMarketingTokensPercent) public onlyOwner {
    marketingTokensPercent = newMarketingTokensPercent;
  }

  function setBountyTokensPercent(uint newBountyTokensPercent) public onlyOwner {
    bountyTokensPercent = newBountyTokensPercent;
  }

  function setFoundersTokensWallet(address newFoundersTokensWallet) public onlyOwner {
    foundersTokensWallet = newFoundersTokensWallet;
  }

  function setMarketingTokensWallet(address newMarketingTokensWallet) public onlyOwner {
    marketingTokensWallet = newMarketingTokensWallet;
  }

  function setBountyTokensWallet(address newBountyTokensWallet) public onlyOwner {
    bountyTokensWallet = newBountyTokensWallet;
  }

  function calculateTokens(uint _invested) internal returns(uint) {
    uint milestoneIndex = currentMilestone(start);
    Milestone storage milestone = milestones[milestoneIndex];
    uint tokens = _invested.mul(price).div(1 ether);
    uint valueBonusTokens = getValueBonusTokens(tokens);
    if(milestone.bonus > 0) {
      tokens =  tokens.add(tokens.mul(milestone.bonus).div(percentRate));
    }
    return tokens.add(valueBonusTokens);
  }

  function finish() public onlyOwner {
    uint summaryTokensPercent = bountyTokensPercent.add(foundersTokensPercent).add(marketingTokensPercent);
    uint mintedTokens = token.totalSupply();
    uint allTokens = mintedTokens.mul(percentRate).div(percentRate.sub(summaryTokensPercent));
    uint foundersTokens = allTokens.mul(foundersTokensPercent).div(percentRate);
    uint marketingTokens = allTokens.mul(marketingTokensPercent).div(percentRate);
    uint bountyTokens = allTokens.mul(bountyTokensPercent).div(percentRate);
    mintTokens(foundersTokensWallet, foundersTokens); 
    mintTokens(marketingTokensWallet, marketingTokens); 
    mintTokens(bountyTokensWallet, bountyTokens); 
    token.finishMinting();
  }

  function endSaleDate() public view returns(uint) {
    return lastSaleDate(start);    
  }

}
