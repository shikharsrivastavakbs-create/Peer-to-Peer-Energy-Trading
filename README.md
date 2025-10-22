Peer-to-Peer Energy Trading
A blockchain-based decentralized platform enabling direct peer-to-peer energy trading between producers (prosumers) and consumers. This project demonstrates how surplus renewable energy can be efficiently and transparently exchanged locally without reliance on centralized utilities, leveraging Ethereum smart contracts for secure, real-time transaction management.

Overview
The system is designed for isolated microgrids or localized energy communities where participants generate, consume, and trade renewable energy directly. By using blockchain, it provides an immutable ledger of transactions, automated settlement via smart contracts, and dynamic pricing mechanisms to optimize energy distribution and costs.

Key Features
Decentralized Trading: Prosumers can publish surplus energy offers; consumers can place bids.

Smart Contracts: Automate trade matching, execution, and settlement securely on the Ethereum blockchain.

Tokenization: Energy units are represented as tokens traded directly between participants.

Dynamic Pricing: Trades consider real-time bids and offers with automatic timeout-based resolution.

Transparency and Security: All transactions are recorded immutably on-chain, fostering trust.

Integration Ready: Can be extended with IoT energy meters for real-time data and off-chain storage solutions for scalability.

How It Works
Registration: Users connect their Ethereum wallets and register as prosumers or consumers.

Offer Creation: Prosumers list available excess energy with prices and quantities.

Bidding: Consumers submit purchase bids on the platform.

Matching & Settlement: Smart contracts handle matching highest bids with offers and automatically transfer tokens and funds.

Transaction Finalization: Trades are recorded permanently, and token balances updated accordingly.

Optional Expansion: Supports multi-party trading including prosumer-to-prosumer and grid interactions.

Installation & Usage
Prerequisites
Node.js and npm

Truffle Suite and Ganache for local blockchain environment

MetaMask or similar Ethereum wallet

Setup
bash
git clone https://github.com/shikharsrivastavakbs-create/Peer-to-Peer-Energy-Trading.git
cd Peer-to-Peer-Energy-Trading
npm install
Running
Compile and deploy contracts with Truffle:

bash
truffle compile
truffle migrate --network development
Test interactions through scripts, console, or a frontend DApp if available.

Connect with an Ethereum wallet to manage your accounts and participate in trades.

Architecture
Ethereum Blockchain: Serves as the ledger and smart contract host.

Smart Contracts: Manage offers, bids, trades, tokenization, and consensus.

User Interface: Optional web-based front end to simplify trading interactions.

Future Work
Integration with IoT devices for live energy meter data.

Off-chain storage to improve blockchain scalability.

Enhanced privacy and security mechanisms.

Dynamic demand-response-based pricing models.

Support for cross-grid and larger microgrid networks.
