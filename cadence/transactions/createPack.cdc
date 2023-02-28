import FungibleToken from 0x9a0766d93b6608b7
import NonFungibleToken from 0x631e88ae7f1d7c20
import FlowToken from 0x7e60df042a9c0868
import StormPack from 0x5494f9859870cf29
import ExampleNFT from 0x5494f9859870cf29


transaction(acc: Address, selected: [UInt64], packs: UInt64) {
    let exampleNFTCollection: &ExampleNFT.Collection
    let stormPackCollection: &StormPack.Collection
    let allNFTs: @[]
    let groupsOfNFTs: @[StormPack.Pack]
    prepare(account: AuthAccount){
        self.groupsOfNFTs <- []
        self.exampleNFTCollection = account.borrow<&ExampleNFT.Collection>(from: ExampleNFT.CollectionStoragePath)
        self.stormPackCollection = account.borrow<&StormPack.Collection>(from: StormPack.CollectionStoragePath)
        for nftID in selected {
            let temp <- self.exampleNFTCollection.withdraw(withdrawID: nftID) as! @ExampleNFT.NFT
            self.allNFTs.append(<-tempNFT)
        }
    }

    execute{
        let x = 0
        while(x < packs){
            groupsOfNFTs.append(<-StormPack.createPack(
                ownerAddress: acc,
                nfts: <- [],
                id: x
            ))
        }
        

    }
}