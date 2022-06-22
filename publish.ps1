Rename-Item "$PSScriptRoot\output" -NewName "SysInternals" 
Publish-Module -Path "$PSScriptRoot\SysInternals" -NuGetApiKey $Env:NUGETAPIKEY