Param(
    [switch]$cleanUp,
	[string]$apiDoctorPath,
	[string]$docSubPath,
	[string]$graphDocsRepo,
	[string]$graphDocsBranch,
	[string]$graphDocsPath
)
$repoPath = (Get-Location).Path
$fullDocsPath = Join-Path $repoPath $graphDocsPath
$fullDocsSubPath =  Join-Path $fullDocsPath $docSubPath
$params ="check-all", "--path", "$fullDocsSubPath", "--ignore-warnings"
$apiDoctor = Join-Path $repoPath $apiDoctorPath

Write-Host "Current Directory" $repoPath
Write-Host "Docs Directory" $fullDocsPath
Write-Host "Docs SubPath" $docSubPath
Write-Host "Full Docs Path" $fullDocsSubPath
Write-Host "ApiDoctor Path" $apiDoctor
Write-Host "Params"  $params

& $apiDoctor $params

# Clean up the stuff we downloaded
if ($cleanUp -eq $true) {
   Remove-Item $graphDocsPath -Recurse -Force
}

if ($LastExitCode -ne 0) {
    Write-Host "Errors were detected. This build failed."
    exit $LastExitCode
}

