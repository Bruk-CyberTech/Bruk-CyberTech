<#
.SYNOPSIS
    This script sets the Startup Type of the "Secondary Logon" (seclogon) service to 'Disabled' 
and stops the service if it is currently running. This is required to reduce the attack surface 
related to privilege escalation through alternate credential execution.


.NOTES
    Author          : Bruk Fisha
    LinkedIn        : linkedin.com/in/Brukfisha/
    GitHub          : github.com/Bruk-CyberTech
    Date Created    : 2025-19-06
    Last Modified   : 2025-19-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000175

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-00-000175).ps1 
#>

# Code Used

Set-Service -Name 'seclogon' -StartupType Disabled
