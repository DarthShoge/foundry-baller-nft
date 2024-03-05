//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;


import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BallerNft is ERC721 {
    uint256 private s_tokenCounter;
    mapping (uint => string) s_idToMapping;
    address private s_admin;

    modifier isAdmin() {
        require(msg.sender == s_admin, "BallerNft: caller is not the admin");
        _;
        
    }

    constructor() ERC721("Ballerz", "PLAYA") {
        s_tokenCounter = 0;
        s_admin = msg.sender;
    }

    function mintNft(string memory tokenUri) public {
        s_idToMapping[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_idToMapping[tokenId];
    }

    function admin() public view isAdmin returns (address) {
        return s_admin;
    }

}