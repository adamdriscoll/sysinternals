@{
    Verb                    = 'Get'
    Noun                    = 'NtfsInfo'
    Description             = 'NTFSInfo is a little applet that shows you information about NTFS volumes.'
    OriginalName            = 'ntfsinfo.exe'
    OriginalCommandElements = @("-accepteula", '-nobanner')
    Parameters              = @(
        @{
            ParameterType = 'String'
            Name          = "DriveLetter"
            Mandatory     = $true
            Description   = "The drive letter to retrieve NTFS information for."
        }
    )
}