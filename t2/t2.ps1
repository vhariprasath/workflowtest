Write-Host "Script 2 called"
# switchoverAutomation/releasePipeline/scripts/adfPipelineRunner.ps1

param (
    [string]$ResourceGroupName,
    [string]$DataFactoryName,
    [string]$PipelineName
)

Write-Output "Running ADF Pipeline with the following parameters:"
Write-Output "Resource Group: $ResourceGroupName"
Write-Output "Data Factory: $DataFactoryName"
Write-Output "Pipeline Name: $PipelineName"

# Example: Add actual Azure Data Factory pipeline trigger command here
# az datafactory pipeline create-run --resource-group $ResourceGroupName --factory-name $DataFactoryName --pipeline-name $PipelineName