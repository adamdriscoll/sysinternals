@{
    Verb                    = 'Get'
    Noun                    = 'LogonSession'
    OriginalName            = 'logonsessions.exe'
    OriginalCommandElements = @("-nobanner", "-c")
    OutputHandlers          = @(
        @{
            ParameterSetName = 'Default'
            HandlerType      = 'Inline'
            Handler          = '$args[0] | ConvertFrom-Csv'
        }
    )
}