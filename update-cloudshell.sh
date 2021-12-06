az login
token="Bearer $(az account get-access-token | jq -r .accessToken)"
Uri="https://management.azure.com/providers/Microsoft.Portal/usersettings/cloudconsole?api-version=2020-04-01-preview"

# Show what the current settings are
az rest --uri $Uri --method get --headers Authorization=$token --headers ContentType="application/json"

# Update settings via a file called default.json
az rest --uri $Uri --method put --headers Authorization=$token --headers ContentType="application/json" --body @default.json
