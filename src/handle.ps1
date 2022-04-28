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
    )
}