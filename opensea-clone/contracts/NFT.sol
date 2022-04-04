//SPDC-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage{

    //counter for NFT id:
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address contractAddress;

    //creating a constructor, the ERC721() function must run before the constructor,
    //thats why we put it with the constructor:
    constructor(address marketplaceAddress) ERC721("Marketplace Tokens", "MT"){
        contractAddress = marketplaceAddress;
    }

    function createToken(string memory tokenURI) public returns(uint){
        //using the counter for setting the id for the token/nft
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI); 
        //giving the permission for people to transact the nfts:
        setApprovalForAll(contractAddress, true);

        return newItemId;
    }

}






