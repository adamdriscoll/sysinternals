$Output = "$PSScriptRoot\output"
$obj = "$PSScriptRoot\obj"
$Version = '1.0.0'

Remove-Item $Output -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $obj -Recurse -Force -ErrorAction SilentlyContinue

$M = Import-Module Microsoft.PowerShell.Crescendo -RequiredVersion 1.0.0 -PassThru -ErrorAction SilentlyContinue
if (-not $M) {
    Install-Module Microsoft.PowerShell.Crescendo -RequiredVersion 1.0.0 -Force -Scope CurrentUser
}

$M = Import-Module Pester -PassThru -ErrorAction SilentlyContinue
if (-not $M) {
    Install-Module Pester -Force -Scope CurrentUser
}

New-Item $Output -ItemType Directory
New-Item $obj -ItemType Directory

$Commands = Get-ChildItem "$PSScriptRoot\src" | ForEach-Object { 
    $Definition = & $_.FullName
    $Command = New-CrescendoCommand -Verb $Definition.Verb -Noun $Definition.Noun -OriginalName $Definition.OriginalName
    $Command.OriginalCommandElements = $Definition.OriginalCommandElements
    $Command.Platform = "Windows"

    if ($Definition.Parameters) {
        $Command.Parameters = $Definition.Parameters | ForEach-Object {
            $Parameter = New-ParameterInfo -Name $_.Name -OriginalName $_.OriginalName 
            $Parameter.OriginalName = $_.OriginalName
            $Parameter.OriginalPosition = $_.OriginalPosition
            $Parameter.ParameterType = $_.ParameterType
            $Parameter
        }
    }

    if ($Definition.OutputHandlers) {
        $Command.OutputHandlers = $Definition.OutputHandlers | ForEach-Object {
            $Handler = New-OutputHandler 
            $Handler.ParameterSetName = $_.ParameterSetName
            $Handler.Handler = $_.Handler
            $Handler.HandlerType = $_.HandlerType
            $Handler.StreamOutput = $_.StreamOutput
            $Handler
        }
    }

    $Command 
}

@{
    '$schema' = 'https://aka.ms/PowerShell/Crescendo/Schemas/2021-11'
    Commands  = $Commands
} | ConvertTo-Json -Depth 5 | Out-File "$obj\Commands.json"

Export-CrescendoModule -ConfigurationFile (Get-ChildItem "$obj") -ModuleName (Join-Path $Output "SysInternals") -Force 

Update-ModuleManifest -Path (Join-Path $Output "SysInternals.psd1") -ModuleVersion $Version

Invoke-Pester -Path "$PSScriptRoot\tests"