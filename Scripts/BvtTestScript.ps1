Param(
   [bool]$isHosted = $false,
   [string]$vstsAccount = "mseng",
   [string]$projectName = "VSOnline",
   [string]$buildDefinitionId = "4699",
   [string]$user = "",
   [string]$token
)

# Base64-encodes the Personal Access Token (PAT) appropriately
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user,$token)))

if ($isHosted -eq $true) {
    $uri = "https://$($vstsAccount).visualstudio.com/DefaultCollection/$($projectName)/_apis/build/definitions/$(buildDefinitionId)?api-version=2.0"
    Write-Host "uri: $uri"

    $patResult = Invoke-RestMethod -Uri $uri -Method Get -ContentType "application/json" -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)}

    $oauthResult = Invoke-RestMethod -Uri $uri -Headers @{Authorization = "Bearer $env:SYSTEM_ACCESSTOKEN"}


}
else {
	$uri = "$($env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI)$env:SYSTEM_TEAMPROJECTID/_apis/build/definitions/$($env:SYSTEM_DEFINITIONID)?api-version=2.0"
	Write-Host "uri: $uri"
    
    $patResult = Invoke-RestMethod -Uri $uri -Method Get -ContentType "application/json" -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)}

	$oauthResult = Invoke-RestMethod -Uri $uri -Headers @{Authorization = "Bearer $env:SYSTEM_ACCESSTOKEN"}

}

Write-Host "patResult: $patResult"
Write-Host "oauthResult: $oauthResult"

if ( $patResult.length -eq $oauthResult.length ) {
    Write-Host "Same build definition object returned"
}
else {
    Write-Error "Different build definition object returned"
}
