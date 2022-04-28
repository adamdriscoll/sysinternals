# SysInternals

PowerShell Crescendo module for SysInternals tools.

# Installation 

This module does not include the commands that it wraps. You can install them with scoop.

```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop bucket add extras
scoop install sysinternals
```

Then you can install this module. 

```powershell
Install-Module SysInternals
```

# Commands

## Get-LogonSession (logonsessions.exe)

If you think that when you logon to a system there's only one active logon session, this utility will surprise you. It lists the currently active logon sessions and, if you specify the -p option, the processes running in each session.

```powershell
Get-LogonSession [<CommonParameters>]
```

## Find-Handle (handle.exe)

Ever wondered which program has a particular file or directory open? Now you can find out. Handle is a utility that displays information about open handles for any process in the system. You can use it to see the programs that have a file open, or to see the object types and names of all the handles of a program.

```powershell
Find-Handle [[-Name] <string>] [[-Process] <string>] [<CommonParameters>]
```

## Show-Dll (listdlls.exe)

ListDLLs is a utility that reports the DLLs loaded into processes. You can use it to list all DLLs loaded into all processes, into a specific process, or to list the processes that have a particular DLL loaded. ListDLLs can also display full version information for DLLs, including their digital signature, and can be used to scan processes for unsigned DLLs.

```powershell
Show-Dll [[-Name] <string>] [[-Process] <string>] [<CommonParameters>]
```

## Start-PsExec (psexec.exe)

Utilities like Telnet and remote control programs like Symantec's PC Anywhere let you execute programs on remote systems, but they can be a pain to set up and require that you install client software on the remote systems that you wish to access. PsExec is a light-weight telnet-replacement that lets you execute processes on other systems, complete with full interactivity for console applications, without having to manually install client software. PsExec's most powerful uses include launching interactive command-prompts on remote systems and remote-enabling tools like IpConfig that otherwise do not have the ability to show information about remote systems.

Note: some anti-virus scanners report that one or more of the tools are infected with a "remote admin" virus. None of the PsTools contain viruses, but they have been used by viruses, which is why they trigger virus notifications.

```powershell
Start-PsExec [[-ComputerName] <string>] [[-Command] <string>] [[-Arguments] <string>] [-System] [<CommonParameters>]
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