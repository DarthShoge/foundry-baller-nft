// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract StatusNft is ERC721 {

    error StatusNft___CantFlipStatus(uint256 tokenId, string reason);

    enum FitnessStatus {
        INJURED, 
        FIT
    }

    mapping(uint256 => FitnessStatus) private s_idToStatus;

    uint256 private s_tokenCounter;
    string private s_injuredSvgUri;
    string private s_fitSvgUri;

    constructor(string memory injSvgUri, 
    string memory fitSvgUri) ERC721("Baller Status", "STATUSZ") {
        s_tokenCounter = 0;
        s_injuredSvgUri = injSvgUri;
        s_fitSvgUri = fitSvgUri;

    }

    function flipStatus(uint256 tokenId) public {
        if(!_isAuthorized(msg.sender,msg.sender, tokenId)) {
            revert StatusNft___CantFlipStatus(tokenId, "Not approved or owner");
        }

        if (s_idToStatus[tokenId] == FitnessStatus.FIT) {
            s_idToStatus[tokenId] = FitnessStatus.INJURED;
        } else if (s_idToStatus[tokenId] == FitnessStatus.INJURED) {
            s_idToStatus[tokenId] = FitnessStatus.FIT;
        } else {
            revert StatusNft___CantFlipStatus(tokenId, "Invalid token id");
        }
    }

    function _baseURI() internal view override returns (string memory) {
        return "data:application/json;base64,";
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_idToStatus[s_tokenCounter] = FitnessStatus.FIT;
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        if (s_idToStatus[tokenId] == FitnessStatus.FIT) {
            return generateTokenMetadata(s_fitSvgUri, "fit");
        } else {
            return generateTokenMetadata(s_injuredSvgUri, "injured");
        }
    }

    function generateTokenMetadata(string memory svgUri, string memory desc) private view returns (string memory) {


        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes( // bytes casting actually unnecessary as 'abi.encodePacked()' returns a bytes
                        abi.encodePacked(
                            '{"name":"',
                            name(), // You can add whatever name here
                            '", "description":"A Baller Status NFT, 100% on Chain!", ',
                            '"attributes": [{"trait_type": "status", "value": ',desc,'}], "image":"',
                            svgUri,
                            '"}'
                        )
                    )
                )
            )
        );

    }

}