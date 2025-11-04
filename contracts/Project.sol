// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Peer-to-Peer Energy Trading
 * @dev A simple implementation of decentralized energy trading between prosumers (sellers) and consumers (buyers).
 */

contract PeerToPeerEnergyTrading {
    
    // Structure for energy trade offer
    struct Trade {
        address seller;
        address buyer;
        uint256 energyAmount; // in kWh
        uint256 pricePerUnit; // price per kWh in wei
        bool completed;
    }

    // Array to store trades
    Trade[] public trades;

    // Mapping to track balances (simulating energy token balances)
    mapping(address => uint256) public energyBalance;
    mapping(address => uint256) public etherBalance;

    // Events for transparency
    event TradeCreated(uint256 tradeId, address indexed seller, uint256 energyAmount, uint256 pricePerUnit);
    event TradeCompleted(uint256 tradeId, address indexed buyer, uint256 totalCost);
    event EnergyAdded(address prosumer, uint256 amount);
    event EnergyConsumed(address consumer, uint256 amount);

    /**
     * @dev Prosumers can add energy they want to sell
     */
    function addEnergy(uint256 amount) public {
        require(amount > 0, "Energy amount must be greater than zero");
        energyBalance[msg.sender] += amount;
        emit EnergyAdded(msg.sender, amount);
    }

    /**
     * @dev Seller creates a new trade offer
     */
    function createTrade(uint256 energyAmount, uint256 pricePerUnit) public {
        require(energyBalance[msg.sender] >= energyAmount, "Not enough energy available to sell");
        trades.push(Trade({
            seller: msg.sender,
            buyer: address(0),
            energyAmount: energyAmount,
            pricePerUnit: pricePerUnit,
            completed: false
        }));
        emit TradeCreated(trades.length - 1, msg.sender, energyAmount, pricePerUnit);
    }

    /**
     * @dev Buyer purchases energy from an active trade
     */
    function buyEnergy(uint256 tradeId) public payable {
        require(tradeId < trades.length, "Invalid trade ID");
        Trade storage t = trades[tradeId];

        require(!t.completed, "Trade already completed");
        require(t.buyer == address(0), "This trade already has a buyer");

        uint256 totalCost = t.energyAmount * t.pricePerUnit;
        require(msg.value == totalCost, "Incorrect Ether amount sent");

        // Transfer Ether to seller
        payable(t.seller).transfer(totalCost);

        // Update balances
        energyBalance[t.seller] -= t.energyAmount;
        energyBalance[msg.sender] += t.energyAmount;
        t.buyer = msg.sender;
        t.completed = true;

        emit TradeCompleted(tradeId, msg.sender, totalCost);
    }

    /**
     * @dev Consumer uses (consumes) energy after purchase
     */
    function useEnergy(uint256 amount) public {
        require(energyBalance[msg.sender] >= amount, "Not enough energy to consume");
        energyBalance[msg.sender] -= amount;
        emit EnergyConsumed(msg.sender, amount);
    }

    /**
     * @dev Getter for total number of trades
     */
    function getTradeCount() public view returns (uint256) {
        return trades.length;
    }
}
