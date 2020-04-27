function StringSID
{
    param
    (
        [parameter(Mandatory=$TRUE)]
        [string] $sAMAccountName,

        [parameter(Mandatory=$TRUE)]
        [string] $oClass,

        [parameter(Mandatory=$TRUE)]

        [string] $oCategory
    )

    # Instantiate Searcher
    $ADSISearcher = [ADSISearcher]"(&(objectClass=$oClass)(objectCategory=$oCategory)(sAMAccountName=$sAMAccountName))"

    # Query AD Object
    $User = $ADSISearcher.FindOne().GetDirectoryEntry()

    # Return SID as String
    (New-Object System.Security.Principal.SecurityIdentifier($User.Properties.objectsid.value,0)).Value
}

StringSID -sAMAccountName '<sAMAccountName>' -oClass 'User' -oCategory 'Person'
