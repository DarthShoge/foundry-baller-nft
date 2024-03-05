// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {StatusNft} from "src/StatusNft.sol";

contract StatusNftTest is Test {
    StatusNft nft;
    address USER = makeAddr("user");
    string constant INJ_URI = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8c3ZnIGhlaWdodD0iMzAwcHgiIHdpZHRoPSIzMDBweCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCjxyYWRpYWxHcmFkaWVudCBpZD0iWCIgY3g9IjE0OS44MzMiIGN5PSIxNDkuODMzIiByPSIxNTAiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4NCjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iI0ZGRkZGRiIvPg0KPHN0b3Agb2Zmc2V0PSIwLjQ5MjMiIHN0b3AtY29sb3I9IiNGREZERkQiLz4NCjxzdG9wIG9mZnNldD0iMC42Njk2IiBzdG9wLWNvbG9yPSIjRjZGNkY2Ii8+DQo8c3RvcCBvZmZzZXQ9IjAuNzk2IiBzdG9wLWNvbG9yPSIjRUJFQkVCIi8+DQo8c3RvcCBvZmZzZXQ9IjAuODk4IiBzdG9wLWNvbG9yPSIjREFEQURBIi8+DQo8c3RvcCBvZmZzZXQ9IjAuOTg0NSIgc3RvcC1jb2xvcj0iI0M0QzRDNCIvPg0KPHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjQkZCRkJGIi8+DQo8L3JhZGlhbEdyYWRpZW50Pg0KPGNpcmNsZSBmaWxsPSJ1cmwoI1gpIiBjeD0iMTQ5LjgiIGN5PSIxNDkuOCIgcj0iMTUwIi8+DQo8cmVjdCBmaWxsPSIjQ0MwMDAwIiBoZWlnaHQ9IjYwIiB3aWR0aD0iMjAwIiB4PSI0OS44IiB5PSIxMTkuOCIvPg0KPHJlY3QgZmlsbD0iI0NDMDAwMCIgaGVpZ2h0PSIyMDAiIHdpZHRoPSI2MCIgeD0iMTE5LjgiIHk9IjQ5LjgiLz4NCjwvc3ZnPg==";
    string constant FIT_URI = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8c3ZnIGhlaWdodD0iMzAwcHgiIHdpZHRoPSIzMDBweCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCjxyYWRpYWxHcmFkaWVudCBpZD0iWCIgY3g9IjE0OS44MzMiIGN5PSIxNDkuODMzIiByPSIxNTAiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4NCjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iI0ZGRkZGRiIvPg0KPHN0b3Agb2Zmc2V0PSIwLjQ5MjMiIHN0b3AtY29sb3I9IiNGREZERkQiLz4NCjxzdG9wIG9mZnNldD0iMC42Njk2IiBzdG9wLWNvbG9yPSIjRjZGNkY2Ii8+DQo8c3RvcCBvZmZzZXQ9IjAuNzk2IiBzdG9wLWNvbG9yPSIjRUJFQkVCIi8+DQo8c3RvcCBvZmZzZXQ9IjAuODk4IiBzdG9wLWNvbG9yPSIjREFEQURBIi8+DQo8c3RvcCBvZmZzZXQ9IjAuOTg0NSIgc3RvcC1jb2xvcj0iI0M0QzRDNCIvPg0KPHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjQkZCRkJGIi8+DQo8L3JhZGlhbEdyYWRpZW50Pg0KPGNpcmNsZSBmaWxsPSJ1cmwoI1gpIiBjeD0iMTQ5LjgiIGN5PSIxNDkuOCIgcj0iMTUwIi8+DQo8cmVjdCBmaWxsPSIjMTFjYzAwIiBoZWlnaHQ9IjYwIiB3aWR0aD0iMjAwIiB4PSI0OS44IiB5PSIxMTkuOCIvPg0KPHJlY3QgZmlsbD0iIzExY2MwMCIgaGVpZ2h0PSIyMDAiIHdpZHRoPSI2MCIgeD0iMTE5LjgiIHk9IjQ5LjgiLz4NCjwvc3ZnPg==";

    function setUp() public {
        vm.deal(USER, 100 ether);
        nft = new StatusNft(INJ_URI, FIT_URI);
    }

    // function testMintNftInitialStatus() public {
    //     vm.prank(USER);
    //     nft.mintNft();
    //     uint256 tokenId = 0;
    //     string memory expected = nft.tokenURI(tokenId);
    //     console.log(expected);
    //     // assert(keccak256(abi.encodePacked(expected)) == keccak256(abi.encodePacked(FIT_URI)));
    // }

}
