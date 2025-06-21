<#
.SYNOPSIS
This PowerShell script configures a system policy to disable the camera on the Windows lock screen by creating and setting the NoLockScreenCamera DWORD value to 1 under the HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization registry path..
    


.NOTES
    Author          : Bruk Fisha
    LinkedIn        : linkedin.com/in/Brukfisha/
    GitHub          : github.com/Bruk-CyberTech
    Date Created    : 2025-20-06
    Last Modified   : 2025-20-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000005).ps1 
#>

# Code Used 

# Create the registry key if it doesn't exist
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Force | Out-Null

# Set the NoLockScreenCamera value to 1 (disable camera on lock screen)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "NoLockScreenCamera" -Value 1 -Type DWord
