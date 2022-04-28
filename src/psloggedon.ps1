@{
    Verb                    = 'Show'
    Noun                    = 'LoggedOnAccount'
    OriginalName            = 'psloggedon.exe'
    OriginalCommandElements = @("-nobanner", '-accepteula')
    Parameters              = @(
        @{
            ParameterType = 'switch'
            OriginalName  = '-l'
            Name          = "Local"
        }
        @{
            ParameterType = 'switch'
            OriginalName  = '-x'
            Name          = "NoLogonTimes"
        }
        @{
            ParameterType    = 'string'
            OriginalPosition = 1
            ParameterSetName = "Computer"
            Name             = "ComputerName"
        }
        @{
            ParameterType    = 'string'
            OriginalPosition = 1
            ParameterSetName = "User"
            Name             = "User"
        }
    )
}