@{
    Verb                    = 'Show'
    Noun                    = 'CoreInfo'
    OriginalName            = 'coreinfo.exe'
    OriginalCommandElements = @("-nobanner", '-accepteula')
    Parameters              = @(
        @{
            ParameterType = 'switch'
            OriginalName  = '-c'
            Name          = "Cores"
        }
        @{
            ParameterType = 'switch'
            OriginalName  = '-f'
            Name          = "Features"
        }
        @{
            ParameterType = 'switch'
            OriginalName  = '-g'
            Name          = "Groups"
        }
        @{
            ParameterType = 'switch'
            OriginalName  = '-l'
            Name          = "Caches"
        }
        @{
            ParameterType = 'switch'
            OriginalName  = '-n'
            Name          = "NumaNodes"
        }
        @{
            ParameterType = 'switch'
            OriginalName  = '-s'
            Name          = "Sockets"
        }
        @{
            ParameterType = 'switch'
            OriginalName  = '-m'
            Name          = "NumaAccessCost"
        }
        @{
            ParameterType = 'switch'
            OriginalName  = '-v'
            Name          = "Virtualization"
        }
    )
}