Rename-Item "$PSScriptRoot\output" "$PSScriptRoot\SysInternals" 
Publish-Module -Path "$PSScriptRoot\SysInternals" -NuGetApiKey $Env:NuGetApiKey