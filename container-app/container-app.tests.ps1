Describe "should" {

    It "create container app" {

        Import-Module $PSScriptRoot/../container-app

        $AppName = "app-name"
        $ResourceGroupName = "test-rg"
        $Location = "uksouth"

        Mock New-AzContainerApp { } -ModuleName container-app -Verifiable

        $Configuration = @{
            AppName = $AppName
            ResourceGroupName = $ResourceGroupName
            Location = $Location
        }

        New-ContainerApp @Configuration

        Should -InvokeVerifiable
    }
}