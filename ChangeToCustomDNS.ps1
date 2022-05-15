param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}
# Set to cloudflare dns
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses "1.1.1.1","1.0.0.1" # <- Put custom dns here

ipconfig /all # Shows your ip config

Write-Host ' _____  _   _  _____    _____      _   '
Write-Host '|  __ \| \ | |/ ____|  / ____|    | |  '
Write-Host '| |  | |  \| | (___   | (___   ___| |_ '
Write-Host '| |  | | . ` |\___ \   \___ \ / _ \ __|'
Write-Host '| |__| | |\  |____) |  ____) |  __/ |_ '
Write-Host '|_____/|_| \_|_____/  |_____/ \___|\__|'
