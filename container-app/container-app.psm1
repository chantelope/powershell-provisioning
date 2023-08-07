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