# OctopusSwap Contracts

**OctopusSwap** is a decentralized exchange (DEX) project deployed on the **Pharos Network**, which is **EVM-compatible**.  
The smart contracts are mainly based on **Uniswap V2** with adaptations for the Pharos environment.

## Contracts Included

- **Multicall.sol**  
  Enables batch on-chain calls to improve dApp efficiency.

- **IUniswapV2Factory.sol**  
  Interface for the Uniswap V2 Factory, responsible for creating liquidity pairs.

- **IUniswapV2Router.sol**  
  Interface for the Uniswap V2 Router, providing liquidity management and swap functionalities.

- **WETH9.sol**  
  Standard Wrapped Native Token contract, wrapping Pharos native tokens into ERC20 format.

## Deployment

Deployment is designed to be simple using **Remix IDE**.  
Follow these steps:

1. Visit [Remix Ethereum IDE](https://remix.ethereum.org/).
2. Upload or copy the contract files into Remix.
3. In the **Solidity Compiler** tab, select the appropriate compiler version (e.g., 0.8.x) and compile the contracts.
4. In the **Deploy & Run Transactions** tab:
    - Set the **Environment** to **Injected Provider - MetaMask** (connected to Pharos network).
    - Select the contract you want to deploy.
    - Fill in the constructor parameters if required.
    - Click **Deploy**.

> **Note:**  
> Make sure your MetaMask is connected to the **Pharos network** with the correct RPC URL and Chain ID.

## Network Information

- **Network:** Pharos Devnet
- **Chain ID:** 50002
- **RPC URL:** https://devnet.dplabs-internal.com/
- **Currency Symbol:** PTT
- **Block Explorer URL:** https://pharosscan.xyz

## License

This project is licensed under the [MIT License](LICENSE).

## Contributing

Pull requests, issues, and suggestions are welcome!  
Feel free to fork and contribute to improving OctopusSwap. Here’s how to get started:

- Fork the repository
- Create a new branch (`git checkout -b feature/YourFeature`)
- Commit your changes (`git commit -m 'Add feature'`)
- Push to the branch (`git push origin feature/YourFeature`)
- Open a Pull Request
