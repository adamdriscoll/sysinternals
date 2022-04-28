@{
    Verb                    = 'Show'
    Noun                    = 'Dll'
    OriginalName            = 'listdlls.exe'
    OriginalCommandElements = @("-accepteula", '-nobanner')
    Parameters              = @(
        @{
            ParameterType    = 'String'
            ParameterSetName = "DLL"
            OriginalName     = "-d"
            Name             = "Name"
        }
        @{
            ParameterType    = 'String'
            ParameterSetName = "Process"
            Name             = "Process"
            OriginalPosition = [Int]::MaxValue
        }
    )
}