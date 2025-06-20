<#
.SYNOPSIS
    Passwords that do not expire increase exposure with a greater probability of being discovered or cracked.
.NOTES

    Author          : Bruk Fisha
    LinkedIn        : linkedin.com/in/Brukfisha/
    GitHub          : github.com/Bruk-CyberTech
    Date Created    : 2024-19-06
    Last Modified   : 2024-19-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000090

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-00-000090).ps1 
#>

#  CODE used

$allUsers = Get-LocalUser

foreach ($user in $allUsers) {
    try {
        # Attempt to change even if account is disabled
        Set-LocalUser -Name $user.Name -PasswordNeverExpires $false
        Write-Host "Changed: $($user.Name)" -ForegroundColor Green
    } catch {
        Write-Host "Error changing: $($user.Name) - $_" -ForegroundColor Red
    }
}
