Param(
    [string] $hugoUri = "https://github.com/gohugoio/hugo/releases/download/v0.53/hugo_extended_0.53_Windows-64bit.zip",
    [string] $destinationFolder = ".\public"
)

$hugoBinFolder = ".\hugo\bin\"
$hugoUriFileName = Split-Path $hugoUri -leaf
$hugoZip = Join-Path $hugoBinFolder $hugoUriFileName
$hugoExe = Join-Path $hugoBinFolder "hugo.exe"

if (-Not(Test-Path $hugoBinFolder))
{
    Write-Host "Creating hugo bin directory..."
    New-Item -ItemType Directory -Force -Path $hugoBinFolder
}

if (-Not(Test-Path $hugoZip))
{
    Write-Host "Downloading hugo release into bin directory..."
    
    # https://stackoverflow.com/questions/41618766/powershell-invoke-webrequest-fails-with-ssl-tls-secure-channel
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    wget $hugoUri -OutFile $hugoZip
}

if (-Not(Test-Path $hugoExe))
{
    Write-Host "Extracting downloaded hugo release in bin directory..."
    Expand-Archive $hugoZip -DestinationPath $hugoBinFolder
}

Write-Host "Executing Hugo to run local site at http://localhost:1313"
&$hugoExe server -D --disableFastRender