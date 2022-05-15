# Change DNS scripts
## About

Used to change between a custom DNS and your Default DNS.

The custom DNS uses the IPv4 settings for cloudflare

## Create a Shortcut to run the scripts

- Copy the full path to your PS1 script file.
- Right click the empty space on your Desktop. Select New - Shortcut from the context menu.
In the shortcut target box type the following, replacing `<location of script>` with the directory to your script eg.C:\Users\UserName\Documents\DefaultDNS.ps1
```
powershell.exe -noexit -ExecutionPolicy Bypass -File <location of script>
```
- Give it a useful name
- Complete!