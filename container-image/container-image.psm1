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