function New-ContainerRegistry{
    param(
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$RegistryName,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$ResourceGroupName,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$Location,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$Sku
    )

    $Configuration = @{
        Name = $RegistryName
        ResourceGroupName = $ResourceGroupName
        Location = $Location
        Sku = $Sku
    }

    New-AzContainerRegistry @Configuration -EnableAdminUser -IdentityType 'SystemAssigned'
}