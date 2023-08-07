Describe "should" {

    It "create resource group" {

        Import-Module $PSScriptRoot/../resource-group

        $ResourceGroupName = "test-rg"
        $Location = "uksouth"

        Mock New-AzResourceGroup { } -ModuleName resource-group -Verifiable

        $Configuration = @{
            Name = $ResourceGroupName
            Location = $Location
        }

        New-ResourceGroup @Configuration

        Should -InvokeVerifiable
    }
}

Describe "should" {

    It "get resource group" {

        Import-Module $PSScriptRoot/../resource-group

        $ResourceGroupName = "test-rg"

        [object]$ResourceGroup = @{
            Name = $ResourceGroupName
        }

        Mock Get-AzResourceGroup { return $ResourceGroup } -ModuleName resource-group -Verifiable

        $Configuration = @{
            Name = $ResourceGroupName 
        }

        $ActualResourceGroup = Get-ResourceGroup @Configuration

        $ActualResourceGroupName = $ActualResourceGroup.Name 

        $ResourceGroupName | Should -Be $ActualResourceGroupName 
    }
}