Write-Host "Script 1 executing"
# scripts/main.ps1

# scripts/script1.ps1

# # Sample input command containing vars.*
# $Command = "Running pipeline with vars.adf_resourcegroupname and vars.datafactoryname"

# # Replace 'vars.*' with '${{ vars.* }}'
# $ConvertedCommand = $Command -replace 'vars\.([a-zA-Z0-9_]+)', '${{ vars.${1} }}'

# Write-Output "Converted Command: $ConvertedCommand"

# $ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# # Call script2.ps1
# Write-Output "Calling Script 2..."
# & "$ScriptDir/../script2.ps1"


# scripts/script1.ps1

# scripts/script1.ps1

# Define the command with vars.*
$Command = "../switchoverAutomation/releasePipeline/scripts/adfPipelineRunner.ps1 -ResourceGroupName vars.adf_resourcegroupname -DataFactoryName vars.datafactoryname -PipelineName vars.activity_check_pipelinename"

# Convert 'vars.*' to '${{ vars.* }}'
$ConvertedCommand = $Command -replace 'vars\.([a-zA-Z0-9_]+)', '${{ vars.${1} }}'
Write-Output "Converted Command: $ConvertedCommand"

# Resolve path to adfPipelineRunner.ps1
$ScriptPath = Resolve-Path "$PSScriptRoot\..\t2\t2.ps1"

# Invoke the script with GitHub Actions variables
& $ScriptPath

Write-Output "All scripts executed successfully!"