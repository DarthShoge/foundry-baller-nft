// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BallerNft} from "src/BallerNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol"; 

contract MintBallerNft is Script {
    string constant BALLER_TEMPLATE = "ipfs://QmQBXfBrfiE1ubMQx6RYH1GDhDTzPcdQnEsmhvTjXek23e?filename=baller_template_metadata.json";
    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment("BallerNft", block.chainid);
        mintNftOnContract(mostRecentDeployed);
    }	
    function mintNftOnContract(address nftContract) internal {
        vm.startBroadcast();
        BallerNft(nftContract).mintNft(BALLER_TEMPLATE);
        vm.stopBroadcast();
    }
}