@{
    Verb                    = 'Find'
    Noun                    = 'Links'
    OriginalName            = 'FindLinks.exe'
    OriginalCommandElements = @("-nobanner","accepteula")
    Parameters              = @(
        @{
            ParameterType    = 'String'
            OriginalPosition = [Int]::MaxValue
            Name             = "File"
        }
    )
}