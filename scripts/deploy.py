from brownie import BullyGoats, config, network, exceptions
from importlib_metadata import requires
from scripts.helpful_scripts import get_account, LOCAL_BLOCKCHAIN_ENVIRONMENTS
import time


def deploy_and_create():
    account = get_account(0)
    contract = BullyGoats.deploy({"from": account})
    print(f"NFT contract deployed at {contract}")
    print(f"Minting NFT...")
    contract.Mint()  # Pass the number of NFTs you want to mint here
    print("Yay, NFT minted.")


def main():
    deploy_and_create()
