<#
.Internet Explorer 11 (IE11) must be removed or disabled on Windows 10 semi-annual channel systems. This is because IE11 is no longer supported by Microsoft on these channels and poses a security risk.
    


.NOTES
    Author          : Bruk Fisha
    LinkedIn        : linkedin.com/in/Brukfisha/
    GitHub          : github.com/Bruk-CyberTech
    Date Created    : 2025-20-06
    Last Modified   : 2025-20-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000391

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000391).ps1 
#>

# Code Used

# Ensure the parent keys exist (ErrorAction SilentlyContinue prevents errors if they already exist)
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer" -ErrorAction SilentlyContinue | Out-Null
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" -ErrorAction SilentlyContinue | Out-Null

# Set the registry value to disable IE11 without notification
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" -Name "NotifyDisableIEOptions" -Value 0 -Type DWord -Force

# For good measure, you can also consider setting the "IE Integration" policy for Edge, though this is less directly about "removing" IE11 itself.
# This policy forces IE mode to be allowed/required in Edge.
# Path: HKLM:\SOFTWARE\Policies\Microsoft\Edge
# Value Name: InternetExplorerIntegrationLevel
# Type: REG_DWORD
# Data: 1 (for 'IE Mode' in Edge) or 0 (for 'Disabled') - '1' is common if you have legacy apps that still need IE mode in Edge.
# Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "InternetExplorerIntegrationLevel" -Value 1 -Type DWord -Force
