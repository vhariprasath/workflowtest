param (
    [string]$KeyVaultName,
    [string]$SecretNames
)

# Authenticate with Azure (assumes az login already done in GitHub runner)
if (-not (Get-AzContext)) {
    Connect-AzAccount -Identity
}

# Split comma-separated secrets
$SecretArray = $SecretNames -split ','

foreach ($SecretName in $SecretArray) {
    try {
        $Secret = Get-AzKeyVaultSecret -VaultName $KeyVaultName -Name $SecretName -ErrorAction Stop
        $SecretValue = $Secret.SecretValueText

        if ([string]::IsNullOrEmpty($SecretValue)) {
            Write-Host "⚠️ WARNING: Secret '$SecretName' exists but is empty."
        } else {
            Write-Host "✅ Secret '$SecretName' retrieved successfully."
        }

        # Set as GitHub environment variable
        Add-Content -Path $env:GITHUB_ENV -Value "$SecretName=$SecretValue"
    }
    catch {
        Write-Host "❌ ERROR: Failed to retrieve secret '$SecretName'."
        Write-Host "Details: $($_.Exception.Message)"
    }
}
