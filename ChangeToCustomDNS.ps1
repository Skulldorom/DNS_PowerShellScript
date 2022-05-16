param([switch]$Elevated) # Checks to see if we tried to elevate

# Variables
# The adapter we are changing the DNS settings for
$adapter = "Ethernet"
# Change these to use a different DNS
$dns = "1.1.1.1", "1.0.0.1"


# To update DNS settings we require admin privileges
# The following code checks if we have admin privileges if not it will try to open a new powershell with the correct privileges. 
function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false) {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    }
    else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

# Sets DNS to custom 
function CustomDNS {
    Set-DnsClientServerAddress -InterfaceAlias $adapter -ServerAddresses $dns[0], $dns[1] # custom dns

    ipconfig /all # Shows your ip config
    Write-Host ''
    Write-Host '__________________________________________'
    Write-Host ''
    Write-Host "    - Custom DNS set to $dns -"
    Write-Host '__________________________________________'
    Write-Host ''
}

# Sets DNS to default
function DefaultDNS {
    Set-DnsClientServerAddress -InterfaceAlias Ethernet -ResetServerAddresses

    ipconfig /all # Shows your ip config
    Write-Host ''
    Write-Host '__________________________________________'
    Write-Host ''
    Write-Host "     - DNS setting reset to default -"
    Write-Host '__________________________________________'
    Write-Host ''
}

# Gets the current DNS settings
$current = Get-DnsClientServerAddress -InterfaceAlias Ethernet -AddressFamily IPv4 | Select-Object -ExpandProperty ServerAddresses

# Checks if the current dns and custom dns are the same
if ( $current[0] -eq $dns[0] -And $current[1] -eq $dns[1] ) {
    DefaultDNS
}
else {
    CustomDNS
}

