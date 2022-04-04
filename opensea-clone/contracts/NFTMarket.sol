//SPDC-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol"; //prevents re-entrancy attacks


contract NFTMarket is ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;
    Counters.Counter private _itemsSold; //total number of items sold


    //inserting a fee for the owner be able to list nfts in our marketplace:
    address payable owner;
    uint256 listingPrice = 0.01 ether;

    constructor(){
        owner = payable(msg.sender);
    }

    struct MarketItem{
        uint itemId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    event MarketItemCreate ( 
        uint indexed itemId,
        address indexed nftContract,
        uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool sold
    );

    mapping(uint256 => MarketItem) private idMarketItem;

    function getListingPrice() public view returns (uint256){
        return listingPrice;
    }

    function createMarketItem(address nftContract, uint256 tokenId, uint256 price) public payable nonReentrant{
        require(msg.value == listingPrice, "Price must be equal to listing price");
        
    }

}