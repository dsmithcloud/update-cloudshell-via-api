Connect-AzAccount
$token = (Get-AzAccessToken).token
$RequestParams = @{
     Method="PUT"
     Uri="https://management.azure.com/providers/Microsoft.Portal/usersettings/cloudconsole?api-version=2017-12-01-preview"
     Body=(Get-Content .\default.json)
     ContentType="application/json"
     Headers=@{
          Authorization="Bearer $token"
     }
}
Invoke-RestMethod @RequestParams