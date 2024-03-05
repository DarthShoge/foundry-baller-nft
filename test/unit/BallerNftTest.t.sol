//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BallerNft} from "src/BallerNft.sol";
import {DeployNft} from "script/DeployNft.s.sol";	


contract BallerNftTest is Test {
    BallerNft nft;
    address admin;
    string constant TOKENURI = "ipfs://QmQBXfBrfiE1ubMQx6RYH1GDhDTzPcdQnEsmhvTjXek23e?filename=baller_template_metadata.json";
    address USER = makeAddr("user");

    function setUp() public {
        vm.deal(USER, 100 ether);
        DeployNft dep = new DeployNft();
        admin = msg.sender;
        nft = dep.run();
    }

    function testNftNameIsCorrect() public {
        string memory name = nft.name();
        string memory expected = "Ballerz";
        assert(keccak256(abi.encodePacked(name)) == keccak256(abi.encodePacked(expected)));
    }

    function testAdminIsCorrect() public {
        vm.prank(admin);
        address expected = nft.admin();
        assert(admin == expected);
    }

    function testMintNft() public {
        vm.prank(USER);
        nft.mintNft(TOKENURI);
        uint256 tokenId = 0;
        string memory expected = nft.tokenURI(tokenId);
        assert(keccak256(abi.encodePacked(TOKENURI)) == keccak256(abi.encodePacked(expected)));
    }   

    function testMintGivesBalance() public {
        vm.prank(USER);
        nft.mintNft(TOKENURI);
        uint256 expected = 1;
        uint256 balance = nft.balanceOf(USER);
        assert(balance == expected);
    }
}