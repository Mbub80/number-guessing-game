# Number Guessing Game DApp

A decentralized number guessing game built on Ethereum blockchain where players can test their luck and win ETH prizes!

## Project Description

The Number Guessing Game is a smart contract-based gambling DApp where players pay an entry fee to guess a secret number within a specified range. Winners receive 80% of the accumulated prize pool, creating an exciting and fair gaming experience on the blockchain. The game features transparent mechanics, player statistics tracking, and dynamic prize pools that grow with each participant.

Players simply pay the entry fee, make their guess, and either win big or contribute to the growing prize pool for future winners. The secret number is generated using blockchain data ensuring fairness and unpredictability.

## Project Vision

To create an engaging, transparent, and fair gaming ecosystem on the blockchain that demonstrates the power of decentralized applications. Our vision is to build a platform where:

- **Transparency** - All game mechanics are visible and verifiable on-chain
- **Fairness** - Random number generation using blockchain entropy
- **Community-driven** - Prize pools grow through community participation
- **Accessibility** - Simple gameplay accessible to all skill levels
- **Trust** - No central authority can manipulate game outcomes

We aim to showcase how blockchain technology can revolutionize traditional gaming by removing intermediaries and ensuring provable fairness.

## Key Features

### 🎮 **Core Game Mechanics**
- **Pay-to-Play**: Entry fee system that builds the prize pool
- **Guess & Win**: Simple number guessing with instant results
- **Dynamic Prize Pool**: 80% of pool awarded to winners, 20% retained for sustainability

### 📊 **Player Statistics**
- **Game History**: Track total games played and won
- **Win Rate Calculation**: Automated win percentage tracking
- **Earnings Tracking**: Monitor total winnings across all games

### 🔧 **Administrative Controls**
- **Parameter Updates**: Owner can adjust number range and entry fees
- **Prize Pool Management**: Add funds or emergency withdrawal capabilities
- **Game Monitoring**: Real-time statistics for total games and winners

### 🛡️ **Security Features**
- **Single Active Game**: Prevents multiple simultaneous games per player
- **Secure Random Generation**: Uses block data for unpredictable numbers
- **Access Controls**: Owner-only functions with proper modifiers

### 📈 **Transparency & Analytics**
- **Public Statistics**: View game info, prize pools, and player stats
- **Event Logging**: All actions recorded as blockchain events
- **Contract Balance Visibility**: Real-time contract balance tracking

## Future Scope

### 🚀 **Phase 1 - Enhanced Gaming Experience**
- **Multiple Difficulty Levels**: Different number ranges with varying prizes
- **Time-Limited Games**: Add countdown timers for increased excitement
- **Hint System**: Paid hints for "higher" or "lower" guidance
- **Leaderboards**: Global ranking system for top players

### 🎯 **Phase 2 - Advanced Features**
- **Tournament Mode**: Scheduled tournaments with mega prizes
- **Team Games**: Collaborative guessing with shared rewards
- **NFT Rewards**: Special NFTs for consecutive wins or milestones
- **Referral System**: Earn bonuses for bringing new players

### 🌐 **Phase 3 - Platform Expansion**
- **Multi-Chain Deployment**: Expand to Polygon, BSC, and other networks
- **Mobile App**: Dedicated mobile application for better UX
- **Social Features**: Chat, friend systems, and social sharing
- **DAO Governance**: Community voting on game parameters and features

### 🔮 **Phase 4 - Ecosystem Development**
- **Game Variants**: Rock-paper-scissors, card games, and more
- **Staking Rewards**: Stake tokens to earn passive rewards
- **Cross-Game Rewards**: Unified reward system across all games
- **Developer API**: Allow third-party integrations and custom games

### 💡 **Technical Improvements**
- **Layer 2 Integration**: Reduce gas fees with optimistic rollups
- **Oracle Integration**: Chainlink VRF for enhanced randomness
- **Upgradeable Contracts**: Proxy patterns for feature updates
- **Gas Optimization**: Further optimize contract efficiency

### 🎨 **User Experience Enhancements**
- **Interactive Frontend**: Rich UI with animations and sound effects
- **Wallet Integration**: Support for multiple wallet providers
- **Real-time Notifications**: Push notifications for game results
- **Analytics Dashboard**: Detailed player performance analytics

---

## Quick Start

1. **Deploy Contract**: Deploy to your preferred Ethereum network
2. **Set Parameters**: Configure number range and entry fee
3. **Add Initial Prize Pool**: Fund the contract to bootstrap gameplay
4. **Start Playing**: Players can begin guessing and winning!

## Contract Functions

- `startGame()` - Begin a new game by paying entry fee
- `makeGuess(uint256 _guess)` - Submit your number guess
- `getGameInfo()` - View current game statistics
- `getPlayerStats(address _player)` - Check player performance
- `updateGameParameters()` - Admin function to modify game settings

---

*Built with ❤️ for the decentralized gaming community*

## Contract Details : 0xa3e948902fe97933c148A7C05E1B4236c9cB6aa6
<img width="959" height="463" alt="image" src="https://github.com/user-attachments/assets/31c32372-6cb4-4d58-8eda-57461ead6028" />
