Describe "should" {

    It "create container registry" {

        Import-Module $PSScriptRoot/../container-registry

        $RegistryName = "app-name"
        $ResourceGroupName = "test-rg"
        $Location = "uksouth"
        $Sku = "Basic" 

        Mock New-AzContainerRegistry { } -ModuleName container-registry -Verifiable

        $Configuration = @{
            RegistryName = $RegistryName
            ResourceGroupName = $ResourceGroupName
            Location = $Location
            Sku = $Sku
        }
    
        New-ContainerRegistry @Configuration

        Should -InvokeVerifiable
    }
}