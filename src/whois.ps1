@{
    Verb                    = 'Find'
    Noun                    = 'Domain'
    OriginalName            = 'whois.exe'
    OriginalCommandElements = @("-nobanner","-accepteula")
    Parameters              = @(
        @{
            ParameterType = 'String'
            Name          = "DomainName"
            OriginalName  = "-v"
        }
    )
}