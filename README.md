# SupplyChainCase

This is prototypes implementation of Supply Chain Case, using Blockchain technology. We tokenised products using standard ERC1155 token. Where ERC1155 token creator can generate and deploy the tokens. 

### Simple Case Study
Conside following Figure.
![See File "Business_Case.pdf"]
Three entities are involded in creating Anti-Aerosol Respirators:
* Respirator Manufacturer
* Filter Manufacturer
* AntiAerosol Manufacturer

Research Paper has detailed description of how it work. This repository will focus more on code reproduction.

### Code Reproduction
**Prerequisites:**
* Ganache UI or Install Ganache Client. If you don't want to download Ganache UI, the with the following command you can install ganache-cli in your terminal
```npm install -g ganache-cli```
* Download Repository and upload all the contact to Remix IDE. ```http://remix.ethereum.org/```

**Step 1:** Clone the repository. On your browser open Remix IDE ```http://remix.ethereum.org/``` and Import all the contracts.

**Step 2:** EVM
- For Ganache-UI
  - Open Ganache Application
  - 'QuickStart Ethereum'
  - Under 'Account & Keys' enter Mnemonic: ```rural knife model observe flight duty three couch category flavor viable convince```
  - Click save and restart
- For Ganache-cli
  - Open Homebrew terminal
  - Enter command ```ganache-cli -m "rural knife model observe flight duty three couch category flavor viable convince"```

You should get output:
```
Available Accounts
==================
(0) 0x000eCE83724975dDcb9Bb7aCaa992d07948A9bF5 (100 ETH)
(1) 0x5fF358377fA2eB2aea812a205AA27a12ed17c4b1 (100 ETH)
(2) 0x3445bA3fAbdA991084D5b54f8b52d832D2Cddf5d (100 ETH)
(3) 0x7B53833Faf74f2306F2a8C8Ee4Ef10FD58A23363 (100 ETH)
(4) 0xbaFD275d55bB0501ceeD2466D79AbF3a43BbF9d7 (100 ETH)
(5) 0x6Aa0E43A66A039b31B5888BCF4449b11bF296BCc (100 ETH)
(6) 0x999279D3Fea6A86d8055781e514be5FFc2A73C37 (100 ETH)
(7) 0x92b2195D829b1AD1Cd746aF7530C9b37a182bfd5 (100 ETH)
(8) 0xcb276Ea8542Da2b0C358E4220ABf728f6c56954E (100 ETH)
(9) 0x63610592ea072615F7d4BEc5842a8726Af9d6c86 (100 ETH)

Private Keys
==================
10 Corresponding private keys.
```

**Step 3:** Select the tab ```Deploy & run tranctions``` and use the Environment "Web3 Provider". Note that if you are using Ganache UI then Web3 Provider Endpoint should be ```http://127.0.0.1:7545```, else for Ganache-cli ```http://127.0.0.1:8545```

**Step 4:** Once environment selected in Remix. Select contract 'ERC1155SupplyChainCompany', And:
- Deploy contracts with string Name 'Respirator Manufacturer' from account ```0x000eCE83724975dDcb9Bb7aCaa992d07948A9bF5```. (1st deployment)
- Deploy contracts with string Name 'Filter Manufacturer' from account ```0x5fF358377fA2eB2aea812a205AA27a12ed17c4b1```. (2nd deployment)
- Deploy contracts with string Name 'AntiAerosol Manufacturer' from account ```0x3445bA3fAbdA991084D5b54f8b52d832D2Cddf5d```. (3rd deployment)

**Step 4:** Once deployed all 3 contracts (as per our use case). Now, we can run jupyter notebook 'Python Notebook - Code Reproduction.ipynb' to interact with blockchain.

