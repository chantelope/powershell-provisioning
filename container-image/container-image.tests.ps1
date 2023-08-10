Describe "should" {

    It "get container image" {

        Import-Module $PSScriptRoot/../container-image

        $AppName = "app-name"
        $ImageName = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
        $ResourceCpu = 2.0
        $ResourceMemory = "4.0Gi"

        Mock New-AzContainerAppTemplateObject { } -ModuleName container-image -Verifiable

        $Configuration = @{
            AppName = $AppName
            ImageName = $ImageName
            ResourceCpu = $ResourceCpu
            ResourceMemory = $ResourceMemory
        }
    
        Get-ContainerImage @Configuration

        Should -InvokeVerifiable
    }
}