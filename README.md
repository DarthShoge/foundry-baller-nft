## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```


### Injury Icon
data:image/svg+xml;base64,
PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8c3ZnIGhlaWdodD0iMzAwcHgiIHdpZHRoPSIzMDBweCIg
eG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCjxyYWRpYWxHcmFkaWVudCBpZD0i
WCIgY3g9IjE0OS44MzMiIGN5PSIxNDkuODMzIiByPSIxNTAiIGdyYWRpZW50VW5pdHM9InVzZXJT
cGFjZU9uVXNlIj4NCjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iI0ZGRkZGRiIvPg0KPHN0
b3Agb2Zmc2V0PSIwLjQ5MjMiIHN0b3AtY29sb3I9IiNGREZERkQiLz4NCjxzdG9wIG9mZnNldD0i
MC42Njk2IiBzdG9wLWNvbG9yPSIjRjZGNkY2Ii8+DQo8c3RvcCBvZmZzZXQ9IjAuNzk2IiBzdG9w
LWNvbG9yPSIjRUJFQkVCIi8+DQo8c3RvcCBvZmZzZXQ9IjAuODk4IiBzdG9wLWNvbG9yPSIjREFE
QURBIi8+DQo8c3RvcCBvZmZzZXQ9IjAuOTg0NSIgc3RvcC1jb2xvcj0iI0M0QzRDNCIvPg0KPHN0
b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjQkZCRkJGIi8+DQo8L3JhZGlhbEdyYWRpZW50Pg0K
PGNpcmNsZSBmaWxsPSJ1cmwoI1gpIiBjeD0iMTQ5LjgiIGN5PSIxNDkuOCIgcj0iMTUwIi8+DQo8
cmVjdCBmaWxsPSIjQ0MwMDAwIiBoZWlnaHQ9IjYwIiB3aWR0aD0iMjAwIiB4PSI0OS44IiB5PSIx
MTkuOCIvPg0KPHJlY3QgZmlsbD0iI0NDMDAwMCIgaGVpZ2h0PSIyMDAiIHdpZHRoPSI2MCIgeD0i
MTE5LjgiIHk9IjQ5LjgiLz4NCjwvc3ZnPg==


### Fit Icon
data:image/svg+xml;base64,
PD94bWwgdmVyc2lvbj0iMS4wIj8+DQo8c3ZnIGhlaWdodD0iMzAwcHgiIHdpZHRoPSIzMDBweCIg
eG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCjxyYWRpYWxHcmFkaWVudCBpZD0i
WCIgY3g9IjE0OS44MzMiIGN5PSIxNDkuODMzIiByPSIxNTAiIGdyYWRpZW50VW5pdHM9InVzZXJT
cGFjZU9uVXNlIj4NCjxzdG9wIG9mZnNldD0iMCIgc3RvcC1jb2xvcj0iI0ZGRkZGRiIvPg0KPHN0
b3Agb2Zmc2V0PSIwLjQ5MjMiIHN0b3AtY29sb3I9IiNGREZERkQiLz4NCjxzdG9wIG9mZnNldD0i
MC42Njk2IiBzdG9wLWNvbG9yPSIjRjZGNkY2Ii8+DQo8c3RvcCBvZmZzZXQ9IjAuNzk2IiBzdG9w
LWNvbG9yPSIjRUJFQkVCIi8+DQo8c3RvcCBvZmZzZXQ9IjAuODk4IiBzdG9wLWNvbG9yPSIjREFE
QURBIi8+DQo8c3RvcCBvZmZzZXQ9IjAuOTg0NSIgc3RvcC1jb2xvcj0iI0M0QzRDNCIvPg0KPHN0
b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjQkZCRkJGIi8+DQo8L3JhZGlhbEdyYWRpZW50Pg0K
PGNpcmNsZSBmaWxsPSJ1cmwoI1gpIiBjeD0iMTQ5LjgiIGN5PSIxNDkuOCIgcj0iMTUwIi8+DQo8
cmVjdCBmaWxsPSIjMTFjYzAwIiBoZWlnaHQ9IjYwIiB3aWR0aD0iMjAwIiB4PSI0OS44IiB5PSIx
MTkuOCIvPg0KPHJlY3QgZmlsbD0iIzExY2MwMCIgaGVpZ2h0PSIyMDAiIHdpZHRoPSI2MCIgeD0i
MTE5LjgiIHk9IjQ5LjgiLz4NCjwvc3ZnPg==