<#
.SYNOPSIS
This PowerShell script configures the system to hide the shared access UI by setting the NC_ShowSharedAccessUI DWORD value to 0 in the HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections registry key. It creates the path if it does not already exist.


.NOTES
    Author          : Bruk Fisha
    LinkedIn        : linkedin.com/in/Brukfisha/
    GitHub          : github.com/Bruk-CyberTech
    Date Created    : 2025-20-06
    Last Modified   : 2025-20-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000044

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .(STIG-ID-WN10-CC-000044).ps1 
#>

# Code Used# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the value of NC_ShowSharedAccessUI to 0 (hide shared access UI)
Set-ItemProperty -Path $regPath -Name "NC_ShowSharedAccessUI" -Value 0 -Type DWord
