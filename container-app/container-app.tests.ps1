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

Describe "should" {

    It "create container app managed environment" {

        Import-Module $PSScriptRoot/../container-app

        $EnvironmentName = "env-name"
        $ResourceGroupName = "test-rg"
        $Location = "uksouth"

        Mock New-AzContainerAppManagedEnv { } -ModuleName container-app -Verifiable

        $Configuration = @{
            EnvironmentName = $EnvironmentName
            ResourceGroupName = $ResourceGroupName
            Location = $Location
        }

        New-ContainerAppManagedEnvironment @Configuration

        Should -InvokeVerifiable
    }
}

Describe "should" {

    It "get container app managed environment" {

        Import-Module $PSScriptRoot/../container-app

        $EnvironmentName = "env-name"
        $ResourceGroupName = "test-rg"

        [object]$ManagedEnvironment = @{
            Id = New-Guid
        }

        Mock Get-AzContainerAppManagedEnv { return $ManagedEnvironment } -ModuleName container-app -Verifiable

        $Configuration = @{
            EnvironmentName = $EnvironmentName
            ResourceGroupName = $ResourceGroupName
        }

        Get-ContainerAppManagedEnvironment @Configuration

        Should -InvokeVerifiable
    }
}

Describe "should" {

    It "assign managed environment to container app" {

        Import-Module $PSScriptRoot/../container-app
        Import-Module $PSScriptRoot/../resource-group

        $AppName = "app-name"
        $EnvironmentName = "env-name"
        $ResourceGroupName = "test-rg"
        $Location = "uksouth"

        [object]$ManagedEnvironment = @{
            Id = New-Guid
        }

        [object]$ResourceGroup = @{
            Name = $ResourceGroupName
            Location = $Location
        }

        Mock Get-ResourceGroup { return $ResourceGroup } -ModuleName container-app -Verifiable
        Mock Get-ContainerAppManagedEnvironment { return $ManagedEnvironment } -ModuleName container-app -Verifiable
        Mock Update-AzContainerApp { } -ModuleName container-app -Verifiable

        $Configuration = @{
            AppName = $AppName
            ResourceGroupName = $ResourceGroupName
            EnvironmentName  = $EnvironmentName
        }

        Update-ContainerApp @Configuration

        Should -InvokeVerifiable
    }
}