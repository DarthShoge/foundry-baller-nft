// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {StatusNft} from "src/StatusNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";


contract DeployStatusNft is Script {
    string constant INJ_URI = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8c3ZnIGhlaWdodD0iMzAwcHgiIHdpZHRoPSIzMDBweCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCjxyYWRpYWxHcmFkaWVudCBpZD0iWCIgY3g9IjE0OS44MzMiIGN5PSIxNDkuODMzIiByPSIxNTAiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4NCjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iI0ZGRkZGRiIvPg0KPHN0b3Agb2Zmc2V0PSIwLjQ5MjMiIHN0b3AtY29sb3I9IiNGREZERkQiLz4NCjxzdG9wIG9mZnNldD0iMC42Njk2IiBzdG9wLWNvbG9yPSIjRjZGNkY2Ii8+DQo8c3RvcCBvZmZzZXQ9IjAuNzk2IiBzdG9wLWNvbG9yPSIjRUJFQkVCIi8+DQo8c3RvcCBvZmZzZXQ9IjAuODk4IiBzdG9wLWNvbG9yPSIjREFEQURBIi8+DQo8c3RvcCBvZmZzZXQ9IjAuOTg0NSIgc3RvcC1jb2xvcj0iI0M0QzRDNCIvPg0KPHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjQkZCRkJGIi8+DQo8L3JhZGlhbEdyYWRpZW50Pg0KPGNpcmNsZSBmaWxsPSJ1cmwoI1gpIiBjeD0iMTQ5LjgiIGN5PSIxNDkuOCIgcj0iMTUwIi8+DQo8cmVjdCBmaWxsPSIjQ0MwMDAwIiBoZWlnaHQ9IjYwIiB3aWR0aD0iMjAwIiB4PSI0OS44IiB5PSIxMTkuOCIvPg0KPHJlY3QgZmlsbD0iI0NDMDAwMCIgaGVpZ2h0PSIyMDAiIHdpZHRoPSI2MCIgeD0iMTE5LjgiIHk9IjQ5LjgiLz4NCjwvc3ZnPg==";
    string constant FIT_URI = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8c3ZnIGhlaWdodD0iMzAwcHgiIHdpZHRoPSIzMDBweCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCjxyYWRpYWxHcmFkaWVudCBpZD0iWCIgY3g9IjE0OS44MzMiIGN5PSIxNDkuODMzIiByPSIxNTAiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4NCjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iI0ZGRkZGRiIvPg0KPHN0b3Agb2Zmc2V0PSIwLjQ5MjMiIHN0b3AtY29sb3I9IiNGREZERkQiLz4NCjxzdG9wIG9mZnNldD0iMC42Njk2IiBzdG9wLWNvbG9yPSIjRjZGNkY2Ii8+DQo8c3RvcCBvZmZzZXQ9IjAuNzk2IiBzdG9wLWNvbG9yPSIjRUJFQkVCIi8+DQo8c3RvcCBvZmZzZXQ9IjAuODk4IiBzdG9wLWNvbG9yPSIjREFEQURBIi8+DQo8c3RvcCBvZmZzZXQ9IjAuOTg0NSIgc3RvcC1jb2xvcj0iI0M0QzRDNCIvPg0KPHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjQkZCRkJGIi8+DQo8L3JhZGlhbEdyYWRpZW50Pg0KPGNpcmNsZSBmaWxsPSJ1cmwoI1gpIiBjeD0iMTQ5LjgiIGN5PSIxNDkuOCIgcj0iMTUwIi8+DQo8cmVjdCBmaWxsPSIjMTFjYzAwIiBoZWlnaHQ9IjYwIiB3aWR0aD0iMjAwIiB4PSI0OS44IiB5PSIxMTkuOCIvPg0KPHJlY3QgZmlsbD0iIzExY2MwMCIgaGVpZ2h0PSIyMDAiIHdpZHRoPSI2MCIgeD0iMTE5LjgiIHk9IjQ5LjgiLz4NCjwvc3ZnPg==";


    function run() external returns (StatusNft) {
        string memory injSvg = vm.readFile("./img/injury_icon.svg");
        string memory fitSvg = vm.readFile("./img/fit_icon.svg");

        vm.startBroadcast();    
        StatusNft nft = new StatusNft(
            svgToImageURI(injSvg),
            svgToImageURI(fitSvg));
        vm.stopBroadcast(); 
        return nft; 
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseUrl = "data:image/svg+xml;base64,";
        string memory encodedSvg = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
            );
        return string(abi.encodePacked(baseUrl, encodedSvg));
    }
}