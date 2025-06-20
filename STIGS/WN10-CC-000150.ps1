<#
.SYNOPSIS
Insures that user must always be required when accessing a system. This setting ensures the user is prompted to require a password when a computer wakes from sleep (plugged in) to be "Enabled"
    


.NOTES
    Author          : Bruk Fisha
    LinkedIn        : linkedin.com/in/Brukfisha/
    GitHub          : github.com/Bruk-CyberTech
    Date Created    : 2025-20-06
    Last Modified   : 2025-20-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000150

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000150).ps1 
#>

# Code Used# Requires PowerShell to be run as Administrator
# This script directly sets the registry key specified by STIG check details
# for "Require a password when a computer wakes (plugged in)" (or what the scanner looks for).

Write-Host "--- Configuring STIG vulnerability: Require a password when a computer wakes (plugged in) ---"
Write-Host "--- Targeting Registry Key from STIG Check: HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\ACSettingIndex = 1 ---"

try {
    # Define the exact registry path and value details as specified in the STIG Check
    $RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
    $ValueName = "ACSettingIndex"
    $ValueData = 1 # 1 = Enabled (for the context of the STIG check)

    # Ensure the parent registry keys exist before attempting to set the value.
    # We need: HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\
    # And then the specific GUID key.
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power" -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings" -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path $RegistryPath -ErrorAction SilentlyContinue | Out-Null # Create the GUID key itself

    # Set the registry value to 1 (Enabled as per STIG check)
    Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -Type DWord -Force

    Write-Host "Registry value '$ValueName' set to '$ValueData' at '$RegistryPath'."

    # Force a Group Policy update. This is important as policies are cached.
    Write-Host "Forcing Group Policy update..."
    gpupdate /force # Display output of gpupdate

    Write-Host "Group Policy update initiated successfully."
    Write-Host "A **restart is highly recommended** for full policy application and Tenable scan compliance."
    Write-Host "----------------------------------------------------------------------------------"

}
catch {
    Write-Error "An error occurred during script execution: $($_.Exception.Message)"
    Write-Host "Please ensure you are running PowerShell with Administrator privileges."
    Write-Host "----------------------------------------------------------------------------------"
}

