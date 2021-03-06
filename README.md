# Change DNS script

## About

Used to change between a custom DNS and your Default DNS.

The custom DNS uses the IPv4 settings for cloudflare
By default it changes the ethernet settings

## Getting Started

- In a new powershell run `Get-NetAdapter`
- Find the name of the adapter that you want to change the DNS for
- Go to ChangeToCustomDNS.ps1 and put the correct adapter name in the `$adapter` variable
- If you want to use a different DNS other than cloudflare then change the `$dns` variable

## How to run

Right click the file and select run with powershell

If you get the following error: `<filename>` cannot be loaded because the execution of scripts is disabled on this system.
Open a new powershell with admin rights and type the following:

```
set-executionpolicy remotesigned
```

## Create a Shortcut

In case you want it to work via a double click

- Copy the full path to your PS1 script file.
- Right click the empty space on your Desktop. Select New - Shortcut from the context menu.
  In the shortcut target box type the following, replacing `<location of script>` with the directory to your script eg.C:\Users\UserName\Documents\DefaultDNS.ps1

```
powershell.exe -noexit -ExecutionPolicy Bypass -File <location of script>
```

- Give it a useful name
- Complete!
