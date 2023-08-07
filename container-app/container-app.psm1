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

    New-AzContainerApp @Configuration
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