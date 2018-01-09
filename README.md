![AKAI](logo.png "AKAI")

# XCOIN smart contract

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
1. _XCOINToken_ - Token contract
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
* _Start_                      : 
* _Wallet_                     : 
* _Contract owner_             : 

#### ICO
* _Base price_                 : 1000 AIC per ETH
* _Hardcap_                    : 20 000 ETH
* _Start_                      : 
* _Wallet_                     : 
* _Contract owner_             : 

_Milestones_
1. 2 days                      : bonus +40% 
2. 7 days                      : bonus +30% 
3. 7 days                      : bonus +20% 
4. 7 days                      : bonus +10%
4. 7 days                      : bonus +5%
4. 7 days                      : wihtout bonus
