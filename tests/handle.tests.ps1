Import-Module "$PSScriptRoot\..\output\SysInternals.psd1" -Force

Describe "Find-Handle" {
    It "should have command" {
        Get-Command Find-Handle | Should -Not -Be $null
    }
}