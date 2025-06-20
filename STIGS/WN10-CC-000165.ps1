<#
.SYNOPSIS
    Implemented STIG ID: WN10-CC-000165 by configuring the "Restrict Unauthenticated RPC clients" setting to "Authenticated" on Windows 10 systems.



.NOTES
    Author          : Bruk Fisha
    LinkedIn        : linkedin.com/in/Brukfisha/
    GitHub          : github.com/Bruk-CyberTech
    Date Created    : 2025-19-06
    Last Modified   : 2025-19-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000165

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000165).ps1 
#>

# Code Used

# Registry path and value
$regPath = "HKLM:\Software\Policies\Microsoft\Windows NT\Rpc"
$regName = "RestrictRemoteClients"
$regValue = 1  # Authenticated

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the value
Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord

Write-Output "'Restrict Unauthenticated RPC clients' set to 'Authenticated' as required by STIG WN10-CC-000165."
