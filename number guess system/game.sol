// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract NumberGuessingGame {
    address public owner;
    uint256 private secretNumber;
    uint256 public minNumber;
    uint256 public maxNumber;
    uint256 public entryFee;
    uint256 public prizePool;
    uint256 public totalGames;
    uint256 public totalWinners;
    
    struct GameStats {
        uint256 gamesPlayed;
        uint256 gamesWon;
        uint256 totalWinnings;
    }
    
    mapping(address => GameStats) public playerStats;
    mapping(address => bool) public hasActiveGame;
    
    event GameStarted(address indexed player, uint256 entryFee);
    event GameWon(address indexed player, uint256 prize, uint256 guessedNumber);
    event GameLost(address indexed player, uint256 guessedNumber, uint256 correctNumber);
    event PrizePoolUpdated(uint256 newPrizePool);
    event GameParametersUpdated(uint256 minNumber, uint256 maxNumber, uint256 entryFee);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    modifier hasNoActiveGame() {
        require(!hasActiveGame[msg.sender], "You already have an active game");
        _;
    }
    
    modifier hasActiveGameRunning() {
        require(hasActiveGame[msg.sender], "No active game found");
        _;
    }
    
    constructor() {
        owner = msg.sender;
        minNumber = 1;
        maxNumber = 100;
        entryFee = 0.01 ether;
        _generateSecretNumber();
    }
    
    // Function 1: Start a new game
    function startGame() external payable hasNoActiveGame {
        require(msg.value >= entryFee, "Insufficient entry fee");
        
        hasActiveGame[msg.sender] = true;
        prizePool += msg.value;
        playerStats[msg.sender].gamesPlayed++;
        totalGames++;
        
        emit GameStarted(msg.sender, msg.value);
        emit PrizePoolUpdated(prizePool);
    }
    
    // Function 2: Make a guess
    function makeGuess(uint256 _guess) external hasActiveGameRunning {
        require(_guess >= minNumber && _guess <= maxNumber, "Guess out of range");
        
        hasActiveGame[msg.sender] = false;
        
        if (_guess == secretNumber) {
            // Player wins
            uint256 prize = (prizePool * 80) / 100; // 80% of prize pool
            prizePool -= prize;
            
            playerStats[msg.sender].gamesWon++;
            playerStats[msg.sender].totalWinnings += prize;
            totalWinners++;
            
            payable(msg.sender).transfer(prize);
            
            emit GameWon(msg.sender, prize, _guess);
            emit PrizePoolUpdated(prizePool);
        } else {
            // Player loses
            emit GameLost(msg.sender, _guess, secretNumber);
        }
        
        // Generate new secret number for next game
        _generateSecretNumber();
    }
    
    // Function 3: Get game information
    function getGameInfo() external view returns (
        uint256 currentPrizePool,
        uint256 currentEntryFee,
        uint256 gameRange,
        uint256 totalGamesPlayed,
        uint256 totalPlayersWon,
        bool playerHasActiveGame
    ) {
        return (
            prizePool,
            entryFee,
            maxNumber - minNumber + 1,
            totalGames,
            totalWinners,
            hasActiveGame[msg.sender]
        );
    }
    
    // Function 4: Get player statistics
    function getPlayerStats(address _player) external view returns (
        uint256 gamesPlayed,
        uint256 gamesWon,
        uint256 totalWinnings,
        uint256 winRate
    ) {
        GameStats memory stats = playerStats[_player];
        uint256 calculatedWinRate = stats.gamesPlayed > 0 ? (stats.gamesWon * 100) / stats.gamesPlayed : 0;
        
        return (
            stats.gamesPlayed,
            stats.gamesWon,
            stats.totalWinnings,
            calculatedWinRate
        );
    }
    
    // Function 5: Update game parameters (Owner only)
    function updateGameParameters(
        uint256 _minNumber,
        uint256 _maxNumber,
        uint256 _entryFee
    ) external onlyOwner {
        require(_maxNumber > _minNumber, "Max number must be greater than min number");
        require(_entryFee > 0, "Entry fee must be greater than 0");
        
        minNumber = _minNumber;
        maxNumber = _maxNumber;
        entryFee = _entryFee;
        
        // Generate new secret number with updated range
        _generateSecretNumber();
        
        emit GameParametersUpdated(_minNumber, _maxNumber, _entryFee);
    }
    
    // Internal function to generate secret number
    function _generateSecretNumber() private {
        secretNumber = (uint256(keccak256(abi.encodePacked(
            block.timestamp,
            block.prevrandao,
            msg.sender,
            totalGames,
            block.number
        ))) % (maxNumber - minNumber + 1)) + minNumber;
    }
    
    // Owner can withdraw remaining funds (emergency function)
    function withdrawFunds() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        
        payable(owner).transfer(balance);
        prizePool = 0;
        emit PrizePoolUpdated(0);
    }
    
    // Add funds to prize pool
    function addToPrizePool() external payable {
        require(msg.value > 0, "Must send some ETH");
        prizePool += msg.value;
        emit PrizePoolUpdated(prizePool);
    }
    
    // Get contract balance
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
