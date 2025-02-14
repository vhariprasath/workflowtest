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

# Convert vars.* to ${{ vars.* }} (Unchanged)
$Command = "Running pipeline with vars.adf_resourcegroupname and vars.datafactoryname"
$ConvertedCommand = $Command -replace 'vars\.([a-zA-Z0-9_]+)', '${{ vars.${1} }}'
Write-Output "Converted Command: $ConvertedCommand"

# Dynamically resolve the path to script2.ps1 (one folder up)
$Script2Path = Resolve-Path "$PSScriptRoot\..\another-folder\script2.ps1"

Write-Output "Executing Script 2 from path: $Script2Path"
& $Script2Path


Write-Output "All scripts executed successfully!"