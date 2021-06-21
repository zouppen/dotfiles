# Keyboard configuration
Windows keyboard settings gui allows setting key repeat delay and time to fast enough.

## Caps to Control
Run in powershell as admin:
```
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};

$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';

New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);
```

-- https://gist.github.com/joshschmelzle/5e88dabc71014d7427ff01bca3fed33d

## "US-FIN" layout:

Zip on this folder has the layout, run AMD64 setup file. Was made on British ISO keyboard, modifications can be made to mapping sources in the source-directory.

### How it was created?

For ISO keyboards the a and o keys should give ä and ö when pressed with AltGr modifier (as using alt in Mac key mapping). Needs to be done on higher level with keyboard layout creator 1.4.

https://www.microsoft.com/en-us/download/details.aspx?id=22339

On Win10 Requires old framework version for the installer: https://docs.microsoft.com/en-gb/dotnet/framework/install/dotnet-35-windows-10



