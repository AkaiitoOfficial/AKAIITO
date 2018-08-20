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
To purchase tokens investor should send ETH (more than minimum 0.005 ETH) to corresponding crowdsale contract.
Recommended GAS: 250000, GAS PRICE - 21 Gwei.

### Wallets with ERC20 support
1. MyEtherWallet - https://www.myetherwallet.com/
2. Parity 
3. Mist/Ethereum wallet

EXODUS not support ERC20, but have way to export key into MyEtherWallet - http://support.exodus.io/article/128-how-do-i-receive-unsupported-erc20-tokens

Investor must not use other wallets, coinmarkets or stocks. Can lose money.

## Main network configuration

* _Minimal insvested limit_     : 0.005 ETH
* _Price_                       : 1 ETH = 1000 AIC
* _Bounty tokens percent_       : 3% 
* _Founders tokens percent_     : 15% 
* _Marketing tokens percent_    : 7% 
* _For sale tokens percent_     : 75% 
* _Founders tokens wallet_      :  0x8C15936004201bC6440a1F0BBD1eC92CA6C611de
* _Marketing tokens wallet_     :  0x778375eB9fA010e95c40EA74ED7591356B4F4F4C

### Links
1. _Token_ - 0x7ca936344d234034cf6936472d6bedbe8ae6667f
2. _Presale_ - 0x12a9dd34e8e7412f9e219fd889d23abc02ba0de5
3. _Mainsale_ - 0x1771e600e72cca46abeab857f301b6bf5a032ca7

### Referal system
* _Referer percent_ - 2%
* _Minimal investor value limit to activate referer bonus_ - 5 ETH
* _Limitations_ - Investor сan't accrue bonus to himself


### Value bonus system

* from 10 ETH bonus +1%
* from 51 ETH bonus +2%
* from 101 ETH bonus +3%
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
* _Wallet_                     : 0x78bcb8dB92462D3c2f6604d697C6edAAe96015b1
* _Contract owner_             : 0x78bcb8dB92462D3c2f6604d697C6edAAe96015b1

#### ICO
* _Base price_                 : 1000 AIC per ETH
* _Hardcap_                    : 25 000 ETH
* _Start_                      : Sat, 12 Mar 2018 00:00:00 GMT
* _Wallet_                     : 0xD5aC604022b9D9953e3ad68Da24e87C7Fb5ED557
* _Contract owner_             : 0x78bcb8dB92462D3c2f6604d697C6edAAe96015b1

_Milestones_
1. 2 days                      : bonus +40% 
2. 7 days                      : bonus +30% 
3. 7 days                      : bonus +20% 
4. 7 days                      : bonus +10%
4. 7 days                      : bonus +5%
4. 7 days                      : without bonus

## Ropsten network configuration (test #1)

* _Minimal insvested limit_     : 0.01 ETH
* _Price_                       : 1 ETH = 1000 AIC
* _Bounty tokens percent_       : 3% 
* _Founders tokens percent_     : 15% 
* _Marketing tokens percent_    : 7% 
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

## Ropsten network configuration (test #2)

* _Minimal insvested limit_     : 0.01 ETH
* _Price_                       : 1 ETH = 1000 AIC
* _Bounty tokens percent_       : 3% 
* _Founders tokens percent_     : 15% 
* _Marketing tokens percent_    : 7% 
* _For sale tokens percent_     : 75% 
* _Founders tokens wallet_      : 0x796b57f96cb7661654981032a5f53047a560e3e0
* _Marketing tokens wallet_     : 0xDa67155b22973bE05Bcd28c07107b2E17314A1e2
* _Bounty tokens wallet_        : 0xA0B1Bd7827C070F29b5aBa47e7B73FF4EfA00a57

### Links
1. _Token_ - https://ropsten.etherscan.io/address/0x00a830c088d013824c80c35d8d037c7740cdcaa8
2. _Presale_ - https://ropsten.etherscan.io/address/0xf29db9c6fd7d9fb1a65b6392d0c6086a513f9d7f
3. _Mainsale_ - https://ropsten.etherscan.io/address/0x2ca9a0cdcef62ccb3d4254ee673dc1aa1e0061cc

### Referal system
* _Referer percent_ - 2%
* _Minimal investor value limit to activate referer bonus_ - 0.1 ETH
* _Limitations_ - Investor сan't accrue bonus to himself


### Value bonus system

* from 1 ETH bonus +3%
* from 1.51 ETH bonus +5%
* from 2.01 ETH bonus +8%
* from 3.01 ETH bonus +10%
* from 10.01 ETH bonus +15%
* from 15.01 ETH bonus +20%

### Crowdsale stages

#### Presale
* _Base price_                 : 1600 AIC per ETH
* _Hardcap_                    : 5 ETH
* _Period_                     : 14 days 
* _Start_                      : Jan 16 2018 01:00:00 GMT+0300
* _Wallet_                     : 0xd89626E2c4218281Ad0Fc5F22AE52dC0FF39DDC4
* _Contract owner_             : 0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A

#### ICO
* _Base price_                 : 1000 AIC per ETH
* _Hardcap_                    : 5 ETH
* _Start_                      : Jan 16 2018 01:00:00 GMT+0300
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
* 0.01 Eth => 16 tokens, gas = 139486
https://ropsten.etherscan.io/tx/0x38ffa22a56f829baeddc4ff3ceceb1d1391dec7c473780f30226c81d9afd481c
* 0.1 Eth => 160 tokens + 3.2 tokens to referrer, gas = 123987
https://ropsten.etherscan.io/tx/0xe83e5d654a5f168c7de6547f0433e02e27525a794ea0dbc26d2e9377b6906f1f
* 0.09 Eth => 144 tokens + 0 tokens to referrer, gas = 71721
https://ropsten.etherscan.io/tx/0x8f475781633383b62c3185ca5d92addaac97fec2970d1623b89edd99fb215551
* 1Eth => 1648 tokens + 32.96 tokens to referrer (3% value bonus), gas = 110699
https://ropsten.etherscan.io/tx/0x78e4f0a71120d5492b7eb5e0d8a56f94529e69bb3aa4612e8e3fe22dd1d31943
* 1.51Eth => 2536.8 tokens (5% value bonus), gas = 72645
https://ropsten.etherscan.io/tx/0x718976f1543dc17ed20bbc6d53eb66a740afd23fc7de2aa7d2f27d04e5e9c982
* 2.01Eth => 3473.28 tokens (8% value bonus), gas = 73933
https://ropsten.etherscan.io/tx/0xe595c07c32b5f47697663af977e0b7625a6c141b5bcf0d3df644c0db6fd3708a
* Rejected purchase after finish() called, gas = 39845
https://ropsten.etherscan.io/tx/0x0feb3c6e3d35d40dbf407cd56f7110ea3a01052133ba8702793e4079572e9f9b

#### Service operations
* finish(), gas = 30439
https://ropsten.etherscan.io/tx/0xf63d7aa9ee1d95f01899cb106a127fe7e7253182fa9889651fd4732e64f4a108

### Test audit (Mainsale)
#### Purchasers
* 0.01 Eth => 14 tokens (40% milestone bonus), gas = 86793
https://ropsten.etherscan.io/tx/0x787ad3f6bf91f8ea90dcae6b750843d829fa80d0a843ad9d2724c1481f368401
* 0.1 Eth => 140 tokens + 2.8 tokens to referrer (40% milestone bonus), gas = 111690
https://ropsten.etherscan.io/tx/0x4915535d9a04ca0acb3034459658a8589bac7ae3e8bd0ada255f7894c94e1231
* 1.51 Eth => 2189.5 tokens (40% milestone bonus, 5% value bonus), gas = 74952
https://ropsten.etherscan.io/tx/0xb3921955522c8f9e635d68c8d621e69b4b49ea3cb38c2b639895c525ea5386d4
* 2.01 Eth => 2773.8 tokens + 55.476 tokens to referrer (30% milestone bonus, 8% value bonus), gas = 117401
https://ropsten.etherscan.io/tx/0xebca687819ed757328b418eb893afabc4768fca14605fd2a84f04bfc1e68a888

#### Service operations
* setStart(), gas = 28262
http://ropsten.etherscan.io/tx/0xcd81e3fdf6f52b133bd4d53433a9c678aef1c7c5176f2eb058f6f88610531cc8
* mintTokensExternal, gas = 56402
https://ropsten.etherscan.io/tx/0xce9ceb622a0c1de0166efbbdae9d7202df98e9d6b645f8850fbc8c34eb64e039
* mintTokensByETHExternal (1 Eth => 1230 tokens, 20% milestone bonus, 3% value bonus), gas = 69222
https://ropsten.etherscan.io/tx/0xb09b4dce6238200ed702262a7ae39252cdef08490420e85e8ea539915b988b04
* finish(), gas = 179624
https://ropsten.etherscan.io/tx/0xbad65bd7573b6f3019ff767b680aec7287279c968454679c11ced21351ee4aa3
