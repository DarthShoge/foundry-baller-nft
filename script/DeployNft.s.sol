// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BallerNft} from "src/BallerNft.sol";

contract DeployNft is Script {
    function run() external returns (BallerNft) {
        vm.startBroadcast();    
        BallerNft nft = new BallerNft();
        vm.stopBroadcast(); 
        return nft; 
    }
}