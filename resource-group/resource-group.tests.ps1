Describe "Should" {

    BeforeAll {

        Import-Module $PSScriptRoot/../resource-group

        Mock New-AzResourceGroup { } -ModuleName resource-group -Verifiable

        $Configuration = @{
            Name = "test-rg"
            Location = "uksouth"
        }

        New-ResourceGroup @Configuration
    }

    It "create resource group" {

        Should -InvokeVerifiable
    }
}