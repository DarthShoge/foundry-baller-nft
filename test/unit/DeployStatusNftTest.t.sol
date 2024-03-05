// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployStatusNft} from "script/DeployStatusNft.s.sol";
import {StatusNft} from "src/StatusNft.sol";


contract StatusNftTest is Test {
    address USER = makeAddr("user");
    DeployStatusNft deployer;
    StatusNft nft;
    string constant INJ_URI = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8c3ZnIGhlaWdodD0iMzAwcHgiIHdpZHRoPSIzMDBweCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCjxyYWRpYWxHcmFkaWVudCBpZD0iWCIgY3g9IjE0OS44MzMiIGN5PSIxNDkuODMzIiByPSIxNTAiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4NCjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iI0ZGRkZGRiIvPg0KPHN0b3Agb2Zmc2V0PSIwLjQ5MjMiIHN0b3AtY29sb3I9IiNGREZERkQiLz4NCjxzdG9wIG9mZnNldD0iMC42Njk2IiBzdG9wLWNvbG9yPSIjRjZGNkY2Ii8+DQo8c3RvcCBvZmZzZXQ9IjAuNzk2IiBzdG9wLWNvbG9yPSIjRUJFQkVCIi8+DQo8c3RvcCBvZmZzZXQ9IjAuODk4IiBzdG9wLWNvbG9yPSIjREFEQURBIi8+DQo8c3RvcCBvZmZzZXQ9IjAuOTg0NSIgc3RvcC1jb2xvcj0iI0M0QzRDNCIvPg0KPHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjQkZCRkJGIi8+DQo8L3JhZGlhbEdyYWRpZW50Pg0KPGNpcmNsZSBmaWxsPSJ1cmwoI1gpIiBjeD0iMTQ5LjgiIGN5PSIxNDkuOCIgcj0iMTUwIi8+DQo8cmVjdCBmaWxsPSIjQ0MwMDAwIiBoZWlnaHQ9IjYwIiB3aWR0aD0iMjAwIiB4PSI0OS44IiB5PSIxMTkuOCIvPg0KPHJlY3QgZmlsbD0iI0NDMDAwMCIgaGVpZ2h0PSIyMDAiIHdpZHRoPSI2MCIgeD0iMTE5LjgiIHk9IjQ5LjgiLz4NCjwvc3ZnPg==";
    string constant FIT_URI = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8c3ZnIGhlaWdodD0iMzAwcHgiIHdpZHRoPSIzMDBweCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCjxyYWRpYWxHcmFkaWVudCBpZD0iWCIgY3g9IjE0OS44MzMiIGN5PSIxNDkuODMzIiByPSIxNTAiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4NCjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iI0ZGRkZGRiIvPg0KPHN0b3Agb2Zmc2V0PSIwLjQ5MjMiIHN0b3AtY29sb3I9IiNGREZERkQiLz4NCjxzdG9wIG9mZnNldD0iMC42Njk2IiBzdG9wLWNvbG9yPSIjRjZGNkY2Ii8+DQo8c3RvcCBvZmZzZXQ9IjAuNzk2IiBzdG9wLWNvbG9yPSIjRUJFQkVCIi8+DQo8c3RvcCBvZmZzZXQ9IjAuODk4IiBzdG9wLWNvbG9yPSIjREFEQURBIi8+DQo8c3RvcCBvZmZzZXQ9IjAuOTg0NSIgc3RvcC1jb2xvcj0iI0M0QzRDNCIvPg0KPHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjQkZCRkJGIi8+DQo8L3JhZGlhbEdyYWRpZW50Pg0KPGNpcmNsZSBmaWxsPSJ1cmwoI1gpIiBjeD0iMTQ5LjgiIGN5PSIxNDkuOCIgcj0iMTUwIi8+DQo8cmVjdCBmaWxsPSIjMTFjYzAwIiBoZWlnaHQ9IjYwIiB3aWR0aD0iMjAwIiB4PSI0OS44IiB5PSIxMTkuOCIvPg0KPHJlY3QgZmlsbD0iIzExY2MwMCIgaGVpZ2h0PSIyMDAiIHdpZHRoPSI2MCIgeD0iMTE5LjgiIHk9IjQ5LjgiLz4NCjwvc3ZnPg==";


    function setUp() public {
        deployer = new DeployStatusNft();
        nft = deployer.run();
    }

    function testProperlyEncodesValue() public {
        string memory svg = '<svg width="200" height="100" xmlns="http://www.w3.org/2000/svg"><text x="10" y="50" font-family="Arial" font-size="24" fill="black">Hello World</text></svg>';
        string memory expected = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48dGV4dCB4PSIxMCIgeT0iNTAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIyNCIgZmlsbD0iYmxhY2siPkhlbGxvIFdvcmxkPC90ZXh0Pjwvc3ZnPg==";
        string memory result = deployer.svgToImageURI(svg);
        assert(keccak256(abi.encodePacked(expected)) == keccak256(abi.encodePacked(result))); 
        // assert(keccak256(abi.encodePacked(expected)) == keccak256(abi.encodePacked(FIT_URI)));
    }

    function testFlipToInjured() public {
        vm.prank(USER);
        nft.mintNft();
        uint256 tokenId = 0;
        nft.flipStatus(tokenId);
        string memory expected = 'data:application/json;base64,eyJuYW1lIjoiQmFsbGVyIFN0YXR1cyIsICJkZXNjcmlwdGlvbiI6IkEgQmFsbGVyIFN0YXR1cyBORlQsIDEwMCUgb24gQ2hhaW4hIiwgImF0dHJpYnV0ZXMiOiBbeyJ0cmFpdF90eXBlIjogInN0YXR1cyIsICJ2YWx1ZSI6IGluanVyZWR9XSwgImltYWdlIjoiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxQRDk0Yld3Z2RtVnljMmx2YmowaU1TNHdJajgrRFFvOGMzWm5JR2hsYVdkb2REMGlNekF3Y0hnaUlIZHBaSFJvUFNJek1EQndlQ0lnZUcxc2JuTTlJbWgwZEhBNkx5OTNkM2N1ZHpNdWIzSm5Mekl3TURBdmMzWm5JajROQ2p4eVlXUnBZV3hIY21Ga2FXVnVkQ0JwWkQwaVdDSWdZM2c5SWpFME9TNDRNek1pSUdONVBTSXhORGt1T0RNeklpQnlQU0l4TlRBaUlHZHlZV1JwWlc1MFZXNXBkSE05SW5WelpYSlRjR0ZqWlU5dVZYTmxJajROQ2p4emRHOXdJRzltWm5ObGREMGlNQ0lnYzNSdmNDMWpiMnh2Y2owaUkwWkdSa1pHUmlJdlBnMEtQSE4wYjNBZ2IyWm1jMlYwUFNJd0xqUTVNak1pSUhOMGIzQXRZMjlzYjNJOUlpTkdSRVpFUmtRaUx6NE5Danh6ZEc5d0lHOW1abk5sZEQwaU1DNDJOamsySWlCemRHOXdMV052Ykc5eVBTSWpSalpHTmtZMklpOCtEUW84YzNSdmNDQnZabVp6WlhROUlqQXVOemsySWlCemRHOXdMV052Ykc5eVBTSWpSVUpGUWtWQ0lpOCtEUW84YzNSdmNDQnZabVp6WlhROUlqQXVPRGs0SWlCemRHOXdMV052Ykc5eVBTSWpSRUZFUVVSQklpOCtEUW84YzNSdmNDQnZabVp6WlhROUlqQXVPVGcwTlNJZ2MzUnZjQzFqYjJ4dmNqMGlJME0wUXpSRE5DSXZQZzBLUEhOMGIzQWdiMlptYzJWMFBTSXhJaUJ6ZEc5d0xXTnZiRzl5UFNJalFrWkNSa0pHSWk4K0RRbzhMM0poWkdsaGJFZHlZV1JwWlc1MFBnMEtQR05wY21Oc1pTQm1hV3hzUFNKMWNtd29JMWdwSWlCamVEMGlNVFE1TGpnaUlHTjVQU0l4TkRrdU9DSWdjajBpTVRVd0lpOCtEUW84Y21WamRDQm1hV3hzUFNJalEwTXdNREF3SWlCb1pXbG5hSFE5SWpZd0lpQjNhV1IwYUQwaU1qQXdJaUI0UFNJME9TNDRJaUI1UFNJeE1Ua3VPQ0l2UGcwS1BISmxZM1FnWm1sc2JEMGlJME5ETURBd01DSWdhR1ZwWjJoMFBTSXlNREFpSUhkcFpIUm9QU0kyTUNJZ2VEMGlNVEU1TGpnaUlIazlJalE1TGpnaUx6NE5Dand2YzNablBnPT0ifQ==';
        string memory result = nft.tokenURI(tokenId);
        console.log(result);  
        assert(keccak256(abi.encodePacked(result)) == keccak256(abi.encodePacked(expected)));
    }

}
