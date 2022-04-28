@{
    Verb                    = 'Get'
    Noun                    = 'LogonSession'
    OriginalName            = 'logonsessions.exe'
    OriginalCommandElements = @("--nobanner", "--accepteula", "-c")
    OutputHandlers          = @(
        @{
            ParameterSetName = 'Default'
            HandlerType      = 'Inline'
            Handler          = '$args[0] | ConvertFrom-Csv'
        }
    )
}