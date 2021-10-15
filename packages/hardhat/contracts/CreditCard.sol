// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
// Contracts
import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "./URIFetcher.sol";

// Interfaces
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "./IWETH.sol";
/*
 * @notice This is an options contract that allows a user to deposit a bundle of tokens for a set price that can be executed at
 *  a later time. This allows users to lend their ETH as collateral for the option and collect a premium by the
 *  option creator.
 */
contract CreditCard is
    ERC721Upgradeable 
{
    

    uint32 constant ONE_YEAR = 31536000;
    uint32 constant ONE_DAY = 86400;
 
    mapping(uint256 => CardData) public creditcards;

 
 
    struct CardData {
        uint256 outstandingBalance; 
    }

    event CardCreated(uint256 indexed cardId, address indexed creator);
 
    

    
    /**
     * @notice Initializes the Option contract as an ERC721 token.
     */
    function initialize(
        string calldata _name,
        string calldata _symbol//,
     
    //    address wethAddress
    ) external initializer {
        __ERC721_init(_name, _symbol);
        
      //  WETH = IWETH(wethAddress);
    }
 

    /**
     * @notice Gets the token metadata URI from the URIFetcher.
     * @param tokenId Token ID to get URI for.
     * @return The token URI hash
     */
    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        return "";
    }

    /**
     * @notice Creates a new option for a bundle of tokens and mints an Option NFT.
     * @param bundle Data describing which tokens to create the option with.
     * @param strikePriceWei Floor price in wei for the entire token bundle.
     * @param duration Max duration, in seconds, the option will last after being filled.
     */
    function createCard( 
    )
        external 
        returns (uint256 cardId_)
    {
   
        // Increment ID counter
        cardId_ = cardCount++;

        // Initialize the options struct data
        CardData storage card = creditcards[optionId_];
        //opt.strikePriceWei = strikePriceWei;
        //opt.premiumAmountWei = premiumAmountWei;
        //opt.duration = duration;

        

        // Mint the option NFT for the creator
        _mint(_msgSender(), optionId_);

        emit CardCreated(cardId_, _msgSender());
    }
 


 
     
     
}
