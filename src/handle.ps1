@{
    Verb                    = 'Find'
    Noun                    = 'Handle'
    OriginalName            = 'handle.exe'
    OriginalCommandElements = @("-nobanner")
    Parameters              = @(
        @{
            ParameterType    = 'String'
            OriginalPosition = [Int]::MaxValue
            Name             = "Name"
        }
        @{
            ParameterType = 'String'
            Name          = "Process"
            OriginalName  = "-p"
        }
        @{
            ParameterType = 'Switch'
            Name          = "UserName"
            OriginalName  = "-u"
        }
        @{
            ParameterType = 'String'
            Name          = "Close"
            OriginalName  = "-c"
        }
        @{
            ParameterType = 'Switch'
            Name          = "NoPrompt"
            OriginalName  = "-y"
        }
    )
}