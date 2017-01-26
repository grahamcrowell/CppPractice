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

Remove-Item -Path $RepoPath/.git -ErrorAction SilentlyContinue
Remove-Item -Path $RepoPath/new.ps1 -ErrorAction SilentlyContinue
Remove-Item -Path $RepoPath/new.bat -ErrorAction SilentlyContinue
Remove-Item -Path $RepoPath/readme.md -ErrorAction SilentlyContinue
Out-File -FilePath $TemplatePath/README.md "# $RepoName"

explorer "https://github.com/new"
pause

# create repo
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/grahamcrowell/$RepoName.git
git push -u origin master

# # copy template files
# $TemplatePath = $PSScriptRoot
# md .vscode
# # cd .vscode
# # copy "%~dp0/.vscode/*.*" "."
# echo %~dp0
# echo %cd%
# copy %~dp0vscode/*.* "%cd%/.vscode"
# dir
# # cd "../VS-Code-Cpp-Template"


# # git add .
# # git commit -m"commit comment"
# # git push -u origin master
# # git pull origin master


