![AKAI](logo.png "AKAI")

# AKAIITO smart contract

* _Standart_        : ERC20
* _Name_            : AIC
* _Ticket_          : AKAI
* _Decimals_        : 18
* _Emission_        : Mintable
* _Crowdsales_      : 2
* _Fiat dependency_ : No
* _Tokens locked_   : Yes

## Smart-contracts description

Contract mint bounty and founders tokens after main sale stage finished. 
Crowdsale contracts have special function to retrieve transferred in errors tokens.
Also crowdsale contracts have special function to direct mint tokens in wei value (featue implemneted to support external pay gateway).

### Contracts contains
1. _AICToken_ - Token contract
2. _Presale_ - Presale contract
3. _Mainsale_ - ICO contract
4. _Configurator_ - contract with main configuration for production

### How to manage contract
To start working with contract you should follow next steps:
1. Compile it in Remix with enamble optimization flag and compiler 0.4.18
2. Deploy bytecode with MyEtherWallet. Gas 5100000 (actually 5073514).
3. Call 'deploy' function on addres from (3). Gas 4000000 (actually 3979551). 

Contract manager must call finishMinting after each crowdsale milestone!
To support external mint service manager should specify address by calling _setDirectMintAgent_. After that specified address can direct mint VST tokens by calling _directMint_.

### How to invest
To purchase tokens investor should send ETH (more than minimum 0.1 ETH) to corresponding crowdsale contract.
Recommended GAS: 250000, GAS PRICE - 21 Gwei.

### Wallets with ERC20 support
1. MyEtherWallet - https://www.myetherwallet.com/
2. Parity 
3. Mist/Ethereum wallet

EXODUS not support ERC20, but have way to export key into MyEtherWallet - http://support.exodus.io/article/128-how-do-i-receive-unsupported-erc20-tokens

Investor must not use other wallets, coinmarkets or stocks. Can lose money.

## Main network configuration

* _Minimal insvested limit_     : 0.01 ETH
* _Price_                       : 1 ETH = 1000 AIC
* _Bounty tokens percent_       : 2% 
* _Founders tokens percent_     : 15% 
* _Marketing tokens percent_    : 8% 
* _For sale tokens percent_     : 75% 
* _Founders tokens wallet_      :  
* _Marketing tokens wallet_     :  
* _Bounty tokens wallet_        : 

### Links
1. _Token_ -
2. _Presale_ -
3. _Mainsale_ -

### Referal system
* _Referer percent_ - 2%
* _Minimal investor value limit to activate referer bonus_ - 10 ETH
* _Limitations_ - Investor сan't accrue bonus to himself


### Value bonus system

* from 100 ETH bonus +3%
* from 151 ETH bonus +5%
* from 201 ETH bonus +8%
* from 301 ETH bonus +10%
* from 1001 ETH bonus +15%
* from 1501 ETH bonus +20%

### Crowdsale stages

#### Presale
* _Base price_                 : 1600 AIC per ETH
* _Hardcap_                    : 1000 ETH
* _Period_                     : 14 days 
* _Start_                      : Mon, 12 Feb 2018 00:00:00 GMT
* _Wallet_                     : 
* _Contract owner_             : 

#### ICO
* _Base price_                 : 1000 AIC per ETH
* _Hardcap_                    : 20 000 ETH
* _Start_                      : Sat, 10 Mar 2018 00:00:00 GMT
* _Wallet_                     : 
* _Contract owner_             : 

_Milestones_
1. 2 days                      : bonus +40% 
2. 7 days                      : bonus +30% 
3. 7 days                      : bonus +20% 
4. 7 days                      : bonus +10%
4. 7 days                      : bonus +5%
4. 7 days                      : without bonus

## Ropsten network configuration

* _Minimal insvested limit_     : 0.01 ETH
* _Price_                       : 1 ETH = 1000 AIC
* _Bounty tokens percent_       : 2% 
* _Founders tokens percent_     : 15% 
* _Marketing tokens percent_    : 8% 
* _For sale tokens percent_     : 75% 
* _Founders tokens wallet_      : 
* _Marketing tokens wallet_     : 
* _Bounty tokens wallet_        : 

### Links
1. _Token_ - https://ropsten.etherscan.io/address/0x9fd1c2ba0c26bdabd777c3522abc332fe19d3f09
2. _Presale_ - https://ropsten.etherscan.io/address/0xc0559bd19ba000304d63b57bbc945ccd22a383dd
3. _Mainsale_ - https://ropsten.etherscan.io/address/0xef69e99d8032cd09440db59ff28f86ede89a6931

### Referal system
* _Referer percent_ - 2%
* _Minimal investor value limit to activate referer bonus_ - 0.1 ETH
* _Limitations_ - Investor сan't accrue bonus to himself


### Value bonus system

* from 1 AIC bonus +3%
* from 1.51 AIC bonus +5%
* from 2.01 AIC bonus +8%
* from 3.01 AIC bonus +10%
* from 10.01 AIC bonus +15%
* from 15.01 AIC bonus +20%

### Crowdsale stages

#### Presale
* _Base price_                 : 1600 AIC per ETH
* _Hardcap_                    : 5 ETH
* _Period_                     : 14 days 
* _Start_                      : Sun Jan 14 2018 16:00:00 GMT
* _Wallet_                     : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4
* _Contract owner_             : 0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A

#### ICO
* _Base price_                 : 1000 AIC per ETH
* _Hardcap_                    : 200 ETH
* _Start_                      : 
* _Wallet_                     : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4
* _Contract owner_             : 0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A

_Milestones_
1. 2 days                      : bonus +40% 
2. 7 days                      : bonus +30% 
3. 7 days                      : bonus +20% 
4. 7 days                      : bonus +10%
4. 7 days                      : bonus +5%
4. 7 days                      : without bonus

### Test audit (Presale)

#### Purchasers
* Rejected purchase below minimum investment limit (0.009 Eth), gas = 21321
https://ropsten.etherscan.io/tx/0x461c52013465f89ada0ee78f7acec3fffa43ba3faf8d70182826605eec3426eb
* 0.01 Eth => 19.2 tokens (20% value bonus), gas = 122147
https://ropsten.etherscan.io/tx/0x117843edfe9b5de0c4a0bc82ab001874767656d512ee0f28615843654fb4e8d5
* 0.09 Eth => 172.8 tokens (20% value bonus) + 0 tokens to referrer, gas = 79382
https://ropsten.etherscan.io/tx/0xc8c4baac250bed1fce4a279bc5c44aa0b895ea3df6f57f23a12358b2ba9bd466
* 0.1 Eth => 192 tokens (20% value bonus) + 3.84 tokens to referrer, gas = 131657
https://ropsten.etherscan.io/tx/0xf7cb39c3fda37561aeff1a9b1ec4c674aca7ed3c7d2ad80fa54927f0228bd110
* Rejected purchase when investor accrued bonus to himself
https://ropsten.etherscan.io/tx/0x898401bfc0959b7ff94b4d95f6b2c20b80a0aa42b88c69c16427e33f5cf5b223
* 0.01 Eth => 1.68 tokens (5% value bonus, price = 160 AIC per ETH), gas = 74766
https://ropsten.etherscan.io/tx/0xddfeccd4af4d58112a50730e9fe23df5e5b237c89e385f8bcb1c3a9acfcd503e
* 0.0125625 Eth => 2.1708 tokens (8% value bonus, price = 160 AIC per ETH), gas = 73819
https://ropsten.etherscan.io/tx/0x6eaa7456094d4b78583c9889bf50d1f3a0948018d16e61625f548f017a6289a3
* 4.9 Eth => 940.8 tokens (20% value bonus, price = 160 AIC per ETH), gas = 77306
https://ropsten.etherscan.io/tx/0x7fff57e70f5e0a3faabe6d5356a7ee06ad8ba3f224d7e6643aad796669491166
* Rejected purchase when hardcap reached, gas = 30345
https://ropsten.etherscan.io/tx/0x2adfbafbae066e138c2f7c9ffd9935db7117a8c8d2bef444abbe110f1022bc77

#### Service operations
* All operations from Deployer
* finish(), gas = 30439
https://ropsten.etherscan.io/tx/0x3799f807d864b2751c91e009d0ba1740c4efbc7053b9412a01ec87ee507b0b5c
