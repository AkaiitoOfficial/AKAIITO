
import ether from './helpers/ether'
import {advanceBlock} from './helpers/advanceToBlock'
import {increaseTimeTo, duration} from './helpers/increaseTime'
import latestTime from './helpers/latestTime'
import EVMThrow from './helpers/EVMThrow'

const BigNumber = web3.BigNumber

const should = require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(BigNumber))
  .should()

const Configurator = artifacts.require('Configurator')

const Token = artifacts.require('XCOINToken')

const Presale = artifacts.require('Presale')

const Mainsale = artifacts.require('Mainsale')

contract('Crowdsale', function(wallets) {

  before(async function() {
    await advanceBlock()
  })
  
  beforeEach(async function () {
    this.configurator = await Configurator.new()
    await this.configurator.deploy()
    this.token = Token.at(await this.configurator.token())
    this.presale = Presale.at(await this.configurator.presale())
    this.mainsale = Mainsale.at(await this.configurator.mainsale())
  })	 
  
  it('Integration test', async function () {

    const owner = wallets[0]

    const defInvestor = wallets[1]

    const minInvestedPresale = ether(0.1)

    const minInvestedMainsale = ether(0.1)
 
    const extInvestorPresale = wallets[2]

    const transferredK = new BigNumber(0.5)

    var presaleInvestorsStartIndex = 3

    var mainsaleInvestorsStartIndex = 13

    const defValue = ether(3)


    var masterWallet = "0x95EA6A4ec9F80436854702e5F05d238f27166A03"

    var bountyTokensWallet = "0x95EA6A4ec9F80436854702e5F05d238f27166A04"

    var foundersTokensWallet = "0x95EA6A4ec9F80436854702e5F05d238f27166A05"

    const presaleStart = 1517317200

    const mainsaleStart = 1525352400

    const basePrice = ether(1000)
 
    const day = 60 * 60 * 24

    const week = 7*day
 
    const masterWalletK = 1

    const bountyTokensK = new BigNumber(0.05)

    const foundersTokensK = new BigNumber(0.13)

    const summaryTokensK = bountyTokensK.add(foundersTokensK)

    var presaleStages = [
	    {'start': presaleStart, 'bonus': 50, 'period': 14, 'invested': 0, 'investors': [

		    {       'address'              : wallets[presaleInvestorsStartIndex    ], 
			    'invested'             : ether(1), 
			    'tokens'               : ether(1500), 
			    'afterSummaryInvested' : ether(1),
		            'afterActualInvested'  : ether(1),
		            'totalSupply'          : ether(1500)},

	            {       'address'              : wallets[presaleInvestorsStartIndex + 1], 
			    'invested'             : ether(2), 
			    'tokens'               : ether(3000), 
			    'afterSummaryInvested' : ether(3),
		            'afterActualInvested'  : ether(1),
		            'totalSupply'          : ether(4500)}

	    ] }, 

	    {'start': presaleStart + 2*week, 'bonus': 40, 'period': 14, 'invested': 0, 'investors': [

		    {       'address'              : wallets[presaleInvestorsStartIndex + 2], 
			    'invested'             : ether(3), 
			    'tokens'               : ether(4200), 
			    'afterSummaryInvested' : ether(6),
		            'afterActualInvested'  : ether(4),
		            'totalSupply'          : ether(8700)},

	            {       'address'              : wallets[presaleInvestorsStartIndex + 3], 
			    'invested'             : ether(4), 
			    'tokens'               : ether(5600), 
			    'afterSummaryInvested' : ether(10),
		            'afterActualInvested'  : ether(4),
		            'totalSupply'          : ether(14300)}

	    ] } 
    ]


    console.log('Presale checks.') 
	  
    var currentSale = this.presale
    var minInvestedLimit = minInvestedPresale
    var stages = presaleStages;	  

    console.log('Rejects before start.')
    await currentSale.sendTransaction({from: defInvestor, value: defValue}).should.be.rejectedWith(EVMThrow)
    await currentSale.directMint(defInvestor, defValue, {from: owner}).should.be.rejectedWith(EVMThrow)

    console.log('Check min invested limit.') 
    var minInvestedLimitFromContract = await currentSale.minInvestedLimit()
    minInvestedLimitFromContract.should.be.bignumber.equal(minInvestedLimit)

    console.log('Check base price.') 
    var basePriceFromContract = await currentSale.price()
    basePriceFromContract.should.be.bignumber.equal(basePrice)

    for(var i = 0; i < stages.length; i++) {
      console.log('Check ' + i + ' stage.')
      let stage = stages[i]

      console.log('Bonus ' + stage['bonus'] + '%, period ' + stage['period'] + ' days, start ' + stage['start'])
      
      var stageFromContract = await currentSale.milestones(i)
      stageFromContract[0].should.be.bignumber.equal(stage['period'])
      stageFromContract[1].should.be.bignumber.equal(stage['bonus'])

      console.log('Increase time to selected stage.')
      await increaseTimeTo(stage['start'])

      console.log('Check current stage index.')
      let stageFromContractIndex = await currentSale.currentMilestone()
      stageFromContractIndex.should.be.bignumber.equal(i)
      console.log('Check current stage options.')
      stageFromContract = await currentSale.milestones(stageFromContractIndex)
      stageFromContract[0].should.be.bignumber.equal(stage['period'])
      stageFromContract[1].should.be.bignumber.equal(stage['bonus'])

      var investor = stage['investors'][0]

      console.log('Investor ' + investor['address'] + ' try to invest ' + investor['invested'] + ' in ETH.')
      await currentSale.sendTransaction({from: investor['address'], value: investor['invested']}).should.be.fulfilled

      console.log('Check investor tokens balance.')
      var balanceOf = await this.token.balanceOf(investor['address'])
      console.log('Investor have ' + balanceOf + ' tokens')
      balanceOf.should.be.bignumber.equal(investor['tokens'])

      console.log('Check summary minted.')
      var totalSupply = await this.token.totalSupply()
      totalSupply.should.be.bignumber.equal(investor['totalSupply']) 

      console.log('Check wallet balance.')
      var curContractBalance = await web3.eth.getBalance(masterWallet)
      curContractBalance.should.be.bignumber.equal(investor['afterActualInvested'])

      console.log('Check contract invest field balance.')
      curContractBalance = await currentSale.invested()
      curContractBalance.should.be.bignumber.equal(investor['afterSummaryInvested'])

      investor = stage['investors'][1]

      console.log('Investor ' + investor['address'] + ' try to invest ' + investor['invested'] + ' in alternative coins.')
      await currentSale.directMint(investor['address'], investor['invested'], {from: owner}).should.be.fulfilled

      console.log('Check rejection during not owner try to call direct mint.')	    
      await currentSale.directMint(investor['address'], investor['invested'], {from: investor['address']}).should.be.rejectedWith(EVMThrow)

      console.log('Check investor tokens balance.')
      balanceOf = await this.token.balanceOf(investor['address'])
      balanceOf.should.be.bignumber.equal(investor['tokens'])

      console.log('Check summary minted.')
      totalSupply = await this.token.totalSupply()
      totalSupply.should.be.bignumber.equal(investor['totalSupply']) 

      console.log('Check wallet balance.')
      curContractBalance = await web3.eth.getBalance(masterWallet)
      curContractBalance.should.be.bignumber.equal(investor['afterActualInvested'])

      console.log('Check contract invest field balance.')
      curContractBalance = await currentSale.invested()
      curContractBalance.should.be.bignumber.equal(investor['afterSummaryInvested'])

      console.log('Check rejection of transfer operation.')
      var transferredValue = investor['tokens'].mul(transferredK)
      await this.token.transfer(defInvestor, transferredValue, {from: investor['address']}).should.be.rejectedWith(EVMThrow)

    }

    console.log('Check summary presale minted.')
    var tempSummaryMinted = stages[1]['investors'][1]['totalSupply']
    var tempTotalSupply = await this.token.totalSupply()
    tempTotalSupply.should.be.bignumber.equal(tempSummaryMinted) 

    console.log('Check wallet balance.')
    var tempCurContractBalance = await web3.eth.getBalance(masterWallet)
    tempCurContractBalance.should.be.bignumber.equal(stages[1]['investors'][1]['afterActualInvested'])

    console.log('Check contract invest field.')
    var tempInvested = await currentSale.invested()
    tempInvested.should.be.bignumber.equal(stages[1]['investors'][1]['afterSummaryInvested'])

    console.log('Check master wallet balance.')
    var curMasterBalance = await web3.eth.getBalance(masterWallet)
    var localMasterBalance = tempCurContractBalance.mul(masterWalletK)
    curMasterBalance.should.be.bignumber.equal(curMasterBalance)

    console.log('Check contract zero balance.')
    tempCurContractBalance = await web3.eth.getBalance(currentSale.address)
    tempCurContractBalance.should.be.bignumber.equal(ether(0))

    var saleEnd = presaleStart + 4*week

    console.log('Increase time to sale end.')
    await increaseTimeTo(saleEnd)

    console.log('Check rejection after sale end.')
    await currentSale.sendTransaction({from: defInvestor, value: defValue}).should.be.rejectedWith(EVMThrow)

    console.log('Finish current sale.')
    await currentSale.finishMinting().should.be.fulfilled

    console.log('Check rejection after sale finished.')
    await currentSale.sendTransaction({from: defInvestor, value: defValue}).should.be.rejectedWith(EVMThrow)

    var allTokens = tempSummaryMinted

    var mainsaleStages = [
	    {'start': mainsaleStart, 'bonus': 30, 'period': 7, 'invested': 0, 'investors': [

		    {       'address'              : wallets[mainsaleInvestorsStartIndex    ], 
			    'invested'             : ether(1), 
			    'tokens'               : ether(1300), 
			    'afterSummaryInvested' : ether(1),
		            'afterActualInvested'  : ether(1),
		            'totalSupply'          : allTokens.add(ether(1300))},

	            {       'address'              : wallets[mainsaleInvestorsStartIndex + 1], 
			    'invested'             : ether(1), 
			    'tokens'               : ether(1300), 
			    'afterSummaryInvested' : ether(2),
		            'afterActualInvested'  : ether(1),
		            'totalSupply'          : allTokens.add(ether(1300).mul(2))}

	    ] }, 

	    {'start': mainsaleStart + week, 'bonus': 20, 'period': 7, 'invested': 0, 'investors': [

		    {       'address'              : wallets[mainsaleInvestorsStartIndex + 2], 
			    'invested'             : ether(1), 
			    'tokens'               : ether(1200), 
			    'afterSummaryInvested' : ether(3),
		            'afterActualInvested'  : ether(2),
		            'totalSupply'          : allTokens.add(ether(1300).mul(2).add(ether(1200)))},

	            {       'address'              : wallets[mainsaleInvestorsStartIndex + 3], 
			    'invested'             : ether(1), 
			    'tokens'               : ether(1200), 
			    'afterSummaryInvested' : ether(4),
		            'afterActualInvested'  : ether(2),
		            'totalSupply'          : allTokens.add(ether(1300).mul(2).add(ether(1200).mul(2)))}

	    ] }, 

	    {'start': mainsaleStart + 2*week, 'bonus': 10, 'period': 7, 'invested': 0, 'investors': [

		    {       'address'              : wallets[mainsaleInvestorsStartIndex + 4], 
			    'invested'             : ether(1), 
			    'tokens'               : ether(1100), 
			    'afterSummaryInvested' : ether(5),
		            'afterActualInvested'  : ether(3),
		            'totalSupply'          : allTokens.add(ether(1300).mul(2).add(ether(1200).mul(2)).add(ether(1100)))},

	            {       'address'              : wallets[mainsaleInvestorsStartIndex + 5], 
			    'invested'             : ether(1), 
			    'tokens'               : ether(1100), 
			    'afterSummaryInvested' : ether(6),
		            'afterActualInvested'  : ether(3),
		            'totalSupply'          : allTokens.add(ether(1300).mul(2).add(ether(1200).mul(2)).add(ether(1100).mul(2)))}

	    ] },

	    {'start': mainsaleStart + 3*week, 'bonus': 0, 'period': 7, 'invested': 0, 'investors': [

		    {       'address'              : wallets[mainsaleInvestorsStartIndex + 6], 
			    'invested'             : ether(1), 
			    'tokens'               : ether(1000), 
			    'afterSummaryInvested' : ether(7),
		            'afterActualInvested'  : ether(4),
		            'totalSupply'          : allTokens.add(ether(1300).mul(2).add(ether(1200).mul(2)).add(ether(1100).mul(2)).add(ether(1000)))},

	            {       'address'              : wallets[mainsaleInvestorsStartIndex + 7], 
			    'invested'             : ether(1), 
			    'tokens'               : ether(1000), 
			    'afterSummaryInvested' : ether(8),
		            'afterActualInvested'  : ether(4),
		            'totalSupply'          : allTokens.add(ether(1300).mul(2).add(ether(1200).mul(2)).add(ether(1100).mul(2)).add(ether(1000).mul(2)))}

	    ] }


    ]


    console.log('Mainsale checks.') 
	  
    var currentSale = this.mainsale
    var minInvestedLimit = minInvestedMainsale
    var stages = mainsaleStages;	  

    console.log('Rejects before start.')
    await currentSale.sendTransaction({from: defInvestor, value: defValue}).should.be.rejectedWith(EVMThrow)
    await currentSale.directMint(defInvestor, defValue, {from: owner}).should.be.rejectedWith(EVMThrow)

    console.log('Check min invested limit.') 
    var minInvestedLimitFromContract = await currentSale.minInvestedLimit()
    minInvestedLimitFromContract.should.be.bignumber.equal(minInvestedLimit)

    console.log('Check base price.') 
    var basePriceFromContract = await currentSale.price()
    basePriceFromContract.should.be.bignumber.equal(basePrice)

    for(var i = 0; i < stages.length; i++) {
      console.log('Check ' + i + ' stage.')
      let stage = stages[i]

      console.log('Bonus ' + stage['bonus'] + '%, period ' + stage['period'] + ' days, start ' + stage['start'])
      
      var stageFromContract = await currentSale.milestones(i)
      stageFromContract[0].should.be.bignumber.equal(stage['period'])
      stageFromContract[1].should.be.bignumber.equal(stage['bonus'])

      console.log('Increase time to selected stage.')
      await increaseTimeTo(stage['start'])

      console.log('Check current stage.')
      let stageFromContractIndex = await currentSale.currentMilestone()
      stageFromContractIndex.should.be.bignumber.equal(i)

      console.log('Check current stage properties.')
      stageFromContract = await currentSale.milestones(stageFromContractIndex)
      stageFromContract[0].should.be.bignumber.equal(stage['period'])
      stageFromContract[1].should.be.bignumber.equal(stage['bonus'])

      var investor = stage['investors'][0]

      console.log('Investor ' + investor['address'] + ' try to invest ' + investor['invested'] + ' in ETH.')

      await currentSale.sendTransaction({from: investor['address'], value: investor['invested']}).should.be.fulfilled

      console.log('Check investor tokens balance.')
      var balanceOf = await this.token.balanceOf(investor['address'])
      balanceOf.should.be.bignumber.equal(investor['tokens'])

      console.log('Check summary minted.')
      var totalSupply = await this.token.totalSupply()
      totalSupply.should.be.bignumber.equal(investor['totalSupply']) 

      tempCurContractBalance = investor['afterActualInvested']

      console.log('Check master wallet balance.')
      var curMasterBalance = await web3.eth.getBalance(masterWallet)
      var localMasterBalance = tempCurContractBalance.mul(masterWalletK)
      curMasterBalance.should.be.bignumber.equal(curMasterBalance)

      console.log('Check contract invest field balance.')
      curContractBalance = await currentSale.invested()
      curContractBalance.should.be.bignumber.equal(investor['afterSummaryInvested'])

      investor = stage['investors'][1]

      console.log('Investor ' + investor['address'] + ' try to invest ' + investor['invested'] + ' in alternative coins.')

      await currentSale.directMint(investor['address'], investor['invested'], {from: owner}).should.be.fulfilled

      console.log('Check rejection during not owner try to call direct mint')	    
      await currentSale.directMint(investor['address'], investor['invested'], {from: investor['address']}).should.be.rejectedWith(EVMThrow)

      console.log('Check investor tokens balance.')
      balanceOf = await this.token.balanceOf(investor['address'])
      balanceOf.should.be.bignumber.equal(investor['tokens'])

      console.log('Check summary minted.')
      totalSupply = await this.token.totalSupply()
      totalSupply.should.be.bignumber.equal(investor['totalSupply']) 

      tempCurContractBalance = investor['afterActualInvested']

      console.log('Check master wallet balance.')
      curMasterBalance = await web3.eth.getBalance(masterWallet)
      localMasterBalance = tempCurContractBalance.mul(masterWalletK)
      curMasterBalance.should.be.bignumber.equal(curMasterBalance)

      console.log('Check contract invest field balance.')
      curContractBalance = await currentSale.invested()
      curContractBalance.should.be.bignumber.equal(investor['afterSummaryInvested'])

      console.log('Check rejection of transfer operation.')
      var transferredValue = investor['tokens'].mul(transferredK)
      await this.token.transfer(defInvestor, transferredValue, {from: investor['address']}).should.be.rejectedWith(EVMThrow)

    }

    tempSummaryMinted = stages[3]['investors'][1]['totalSupply'].sub(allTokens)
    allTokens = stages[3]['investors'][1]['totalSupply']

    console.log('Check summary minted.')
    tempTotalSupply = await this.token.totalSupply()
    tempTotalSupply.should.be.bignumber.equal(allTokens) 

    console.log('Check contract invest field balance.')
    curContractBalance = await currentSale.invested()
    curContractBalance.should.be.bignumber.equal(stages[3]['investors'][1]['afterSummaryInvested'])

    tempCurContractBalance = stages[3]['investors'][1]['afterActualInvested']

    console.log('Check master wallet balance.')
    curMasterBalance = await web3.eth.getBalance(masterWallet)
    localMasterBalance = tempCurContractBalance.mul(masterWalletK)
    curMasterBalance.should.be.bignumber.equal(curMasterBalance)

    console.log('Check contract zero balance.')
    tempCurContractBalance = await web3.eth.getBalance(currentSale.address)
    tempCurContractBalance.should.be.bignumber.equal(ether(0))

    var saleEnd = mainsaleStart + 4*week

    console.log('Increase time to sale end.')
    await increaseTimeTo(saleEnd)

    console.log('Check rejection after sale end.')
    await currentSale.sendTransaction({from: defInvestor, value: defValue}).should.be.rejectedWith(EVMThrow)

    console.log('Finish current sale.')
    await currentSale.finishMinting().should.be.fulfilled
   
    tempSummaryMinted = allTokens.div((new BigNumber(1)).sub(summaryTokensK))
    allTokens = tempSummaryMinted

    var filter = new BigNumber(1000000)

    console.log('Check summary minted.')
    tempTotalSupply = await this.token.totalSupply()
    tempTotalSupply.div(filter).toFixed(0).should.be.bignumber.equal(allTokens.div(filter).toFixed(0)) 

    console.log('Check summary mainsale minted.')
    var currentSaleMinted = await this.token.totalSupply()	  
    currentSaleMinted.div(filter).toFixed(0).should.be.bignumber.equal(tempSummaryMinted.div(filter).toFixed(0)) 

    console.log('Check bounty tokens.')
    var bountyTokens = tempSummaryMinted.mul(bountyTokensK)
    var bountyTokensFromContract = await this.token.balanceOf(bountyTokensWallet)
    bountyTokensFromContract.toFixed(0).should.be.bignumber.equal(bountyTokens.toFixed(0))

    console.log('Check founders tokens.')
    var foundersTokens = tempSummaryMinted.mul(foundersTokensK)
    var foundersTokensFromContract = await this.token.balanceOf(foundersTokensWallet)
    foundersTokensFromContract.toFixed(0).should.be.bignumber.equal(foundersTokens.toFixed(0))

    console.log('Check tokens transfer')	  
    var investor = stages[0]['investors'][0]
    var investorTokens = investor['tokens']
    transferredValue = investorTokens.mul(new BigNumber(0.5))
    await this.token.transfer(defInvestor, transferredValue, {from: investor['address']}).should.be.fulfilled

    console.log('Check tokens balances after transfer')	  
    var defInvTokens = await this.token.balanceOf(defInvestor)
    defInvTokens.should.be.bignumber.equal(transferredValue)

    var currentTokens = investor['tokens'].sub(transferredValue)
    var fromTokens = await this.token.balanceOf(investor['address'])
    fromTokens.should.be.bignumber.equal(currentTokens)

    console.log('Finished!')	  


  })

})
