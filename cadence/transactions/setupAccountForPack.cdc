import StormPack from 0x5494f9859870cf29
import FungibleToken from 0x9a0766d93b6608b7


transaction() {
    prepare(account: AuthAccount) {
        if(account.getCapability<&{StormPack.CollectionPublic}>(StormPack.CollectionPublicPath) == nil) {
            let wallet =  account.getCapability<&FlowToken.Vault{FungibleToken.Receiver}>(/public/flowTokenReceiver)
            account.save<@StormPack.Collection>(<- StormPack.createEmptyCollection(ownerVault: wallet), to: StormPack.CollectionStoragePath)
            account.link<&{StormPack.CollectionPublic}>(StormPack.CollectionPublicPath, target: StormPack.CollectionStoragePath)
        }
    }

}