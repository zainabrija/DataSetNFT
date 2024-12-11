// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721Enumerable, Ownable {
    uint256 public constant MINT_PRICE = 0.01 ether;  // Price to mint an NFT
    uint256 public constant MAX_SUPPLY = 10;          // Maximum number of NFTs

    // Constructor that passes name and symbol to ERC721
    constructor() ERC721("MyNFT", "NFT") Ownable(msg.sender) {
        // Ownable automatically assigns the deployer as the owner
    }

    // Public function to mint a new NFT
    function mintNFT() public payable {
        require(totalSupply() < MAX_SUPPLY, "All NFTs have been minted");
        require(msg.value == MINT_PRICE, "Incorrect Ether value sent");

        uint256 tokenId = totalSupply() + 1;  // Token IDs start from 1
        _safeMint(msg.sender, tokenId);       // Mint the NFT to the sender
    }

    // Function to withdraw contract balance to the owner's address
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;  // Check contract balance
        require(balance > 0, "No Ether to withdraw");

        // Transfer the contract balance to the contract owner
        payable(owner()).transfer(balance);
    }
}
