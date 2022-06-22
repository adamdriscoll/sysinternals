# SysInternals

PowerShell Crescendo module for SysInternals tools.

![](https://img.shields.io/powershellgallery/dt/sysinternals?style=for-the-badge)

# Installation 

This module does not include the commands that it wraps. You can install them with scoop or Chocolatey.

```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop bucket add extras
scoop install sysinternals
```

```powershell
choco install sysinternals
```

To install this module: 

```powershell
Install-Module SysInternals
```


# Commands
## Get-LogonSession ([logonsessions.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/logonsessions))

```powershell
Get-LogonSession [<CommonParameters>]
```

## Find-Handle ([handle.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/handle))

```powershell
Find-Handle [[-Name] <string>] [[-Process] <string>] [<CommonParameters>]
```

## Show-ClockResolution ([clockres.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/clockres))

```powershell
Show-ClockResolution [<CommonParameters>]
```

## Show-CoreInfo ([coreinfo.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/coreinfo))

```powershell
Show-CoreInfo [-Cores] [-Features] [-Groups] [-Caches] [-NumaNodes] [-Sockets] [-NumaAccessCost] [-Virtualization] [<CommonParameters>]
```

## Show-Dll ([listdlls.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/listdlls))

```powershell
Show-Dll [[-Name] <string>] [[-Process] <string>] [<CommonParameters>]
```

## Show-LoggedOnAccount ([psloggedon.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/psloggedon))

```powershell
Show-LoggedOnAccount [[-ComputerName] <string>] [[-User] <string>] [-Local] [-NoLogonTimes] [<CommonParameters>]
```

## Show-NamedPipe ([pipelist.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/pipelist))

```powershell
Show-NamedPipe [<CommonParameters>]
```

## Start-PsExec ([psexec.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/psexec))

```powershell
Start-PsExec [[-ComputerName] <string>] [[-Command] <string>] [[-Arguments] <string>] [-System] [<CommonParameters>]
```

## Sync-Disk ([sync.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/sync))

```powershell
Sync-Disk [[-Drive] <string>] [-FlushRemovableDrive] [-EjectRemovableDrive] [<CommonParameters>]
```

# Contributing

Commands are defined in the [src](./src) directory. Each command should be in a PS1 file with the same name as the SysInternal tool. Commands are defined by hashtables that match the Crescendo JSON format. 

For example, the `Get-LogonSession` cmdlet is defined using this hashtable. 

```powershell
@{
    Verb                    = 'Get'
    Noun                    = 'LogonSession'
    OriginalName            = 'logonsession.exe'
    OriginalCommandElements = @("--nobanner", "--acceptlogo", "-c")
    OutputHandlers          = @(
        @{
            ParameterSetName = 'Default'
            HandlerType      = 'Inline'
            Handler          = '$args[0] | ConvertFrom-Csv'
        }
    )
}
```

To build and test the module, run `build.ps1`. 
