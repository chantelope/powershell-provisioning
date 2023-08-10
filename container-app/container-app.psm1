function New-ContainerApp{
    param(
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$AppName,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$ResourceGroupName,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$Location
    )

    $Configuration = @{
        Name = $AppName
        ResourceGroupName = $ResourceGroupName
        Location = $Location
    }

    New-AzContainerApp @Configuration -IdentityType 'SystemAssigned'
}

function New-ContainerAppManagedEnvironment{
    param(
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$EnvironmentName,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$ResourceGroupName,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$Location
    )

    $Configuration = @{
        EnvName = $EnvironmentName
        ResourceGroupName = $ResourceGroupName
        Location = $Location
    }

    New-AzContainerAppManagedEnv @Configuration
}

function Get-ContainerAppManagedEnvironment{
    param(
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$EnvironmentName,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$ResourceGroupName
    )

    $Configuration = @{
        EnvName = $EnvironmentName
        ResourceGroupName = $ResourceGroupName
    }

    Get-AzContainerAppManagedEnv @Configuration
}

function Update-ContainerApp{
    param(
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$AppName,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$ResourceGroupName,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$EnvironmentName

    )

    Import-Module $PSScriptRoot/../resource-group

    $Location = (Get-ResourceGroup -Name $ResourceGroupName).Location
    $ManagedEnvironmentId = (Get-ContainerAppManagedEnvironment -EnvironmentName $EnvironmentName -ResourceGroupName $ResourceGroupName).Id 

    $Configuration = @{
        Name = $AppName
        ResourceGroupName = $ResourceGroupName
        ManagedEnvironmentId  = $ManagedEnvironmentId 
        Location = $Location
    }

    Update-AzContainerApp @Configuration
}

function Get-ContainerImage {
    param(
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$AppName,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$ImageName, 
        [parameter(Mandatory=$true)][ValidateNotNull()][decimal]$ResourceCpu,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$ResourceMemory
    )

    $Configuration = @{
        Name = $AppName
        Image = $ImageName
        ResourceCpu = $ResourceCpu
        ResourceMemory = $ResourceMemory
    }

    New-AzContainerAppTemplateObject @Configuration
}