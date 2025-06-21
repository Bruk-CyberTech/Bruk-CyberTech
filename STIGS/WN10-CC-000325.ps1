<#
.SYNOPSIS
This script sets the DisableAutomaticRestartSignOn. It disables Windows’ automatic sign-on after a restart (such as after an update). It ensures the registry path exists before applying the setting.
DWORD value to 1 under HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System.
    


.NOTES
    Author          : Bruk Fisha
    LinkedIn        : linkedin.com/in/Brukfisha/
    GitHub          : github.com/Bruk-CyberTech
    Date Created    : 2025-20-06
    Last Modified   : 2025-20-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000325

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\>(STIG-ID-WN10-CC-000325).ps1 
#>

# Code that was Used# Define the registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the value of DisableAutomaticRestartSignOn to 1
Set-ItemProperty -Path $regPath -Name "DisableAutomaticRestartSignOn" -Value 1 -Type DWord
