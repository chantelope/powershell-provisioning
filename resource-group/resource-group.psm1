function New-ResourceGroup {
    param(
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$Name,
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$Location
    )

    New-AzResourceGroup -Name $Name -Location $Location
}

function Get-ResourceGroup {
    param(
        [parameter(Mandatory=$true)][ValidateNotNull()][string]$Name
    )

    Get-AzResourceGroup -Name $Name
}