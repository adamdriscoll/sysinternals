@{
    Verb                    = 'Sync'
    Noun                    = 'Disk'
    OriginalName            = 'sync.exe'
    OriginalCommandElements = @("-nobanner", '-accepteula')
    Parameters              = @(
        @{
            ParameterType    = 'string'
            OriginalPosition = 1
            Name             = "Drive"
        }
        @{
            ParameterType = 'switch'
            OriginalName  = "-f"
            Name          = "FlushRemovableDrive"
        }
        @{
            ParameterType = 'switch'
            OriginalName  = "-e"
            Name          = "EjectRemovableDrive"
        }
    )
}