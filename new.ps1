$RepoName = Read-Host -Prompt 'Input Repo Name'
Set-Clipboard $RepoName
$TemplatePath = $PSScriptRoot
$RepoPath = "../$RepoName"


New-Item -Path $RepoPath -ItemType Directory

$files = Get-ChildItem -Path $TemplatePath -File
foreach($file in $files)
{
    Write-Host $file
    Copy-Item -Path $TemplatePath/$file -Destination $RepoPath
}

$folders = Get-ChildItem -Path $TemplatePath -Directory
foreach($folder in $folders)
{
    Write-Host $folder
    Copy-Item -Path $TemplatePath/$folder -Destination $RepoPath -Recurse -Container
}


Remove-Item -Path $RepoPath/new.ps1
Remove-Item -Path $RepoPath/new.bat
Remove-Item -Path $RepoPath/readme.md
Out-File -FilePath $RepoPath/README.md -InputObject "# $RepoName"


explorer "https://github.com/new"
pause


# create repo
Set-Location -Path $RepoPath
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/grahamcrowell/$RepoName.git
git push -u origin master


# TODO: open folder with new instance of vs-code