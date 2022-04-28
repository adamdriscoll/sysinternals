@{
    Verb                    = 'Start'
    Noun                    = 'PsExec'
    OriginalName            = 'psexec.exe'
    OriginalCommandElements = @("--nobanner", "--accepteula")
    Parameters              = @(
        @{
            ParameterType    = 'String'
            OriginalPosition = 0
            Name             = "ComputerName"
        }
        @{
            ParameterType    = 'String'
            OriginalPosition = 1
            Name             = "Command"
        }
        @{
            ParameterType    = 'String'
            OriginalPosition = 2
            Name             = "Arguments"
        }
        @{
            ParameterType = 'Switch'
            OriginalName  = "-s"
            Name          = "System"
        }
    )
    OutputHandlers          = @(
        @{
            ParameterSetName = 'Default'
            HandlerType      = 'Inline'
            Handler          = '$args[0] | ConvertFrom-Csv'
        }
    )
}