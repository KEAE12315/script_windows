<#
.SYNOPSIS
将字幕文件软嵌入到视频文件中

.DESCRIPTION
根据视频文件和字幕文件，将字幕软嵌入到视频中。需要先在系统环境变量里设置ffmpeg。

.PARAMETER videoFilePath
需要被嵌入字幕的视频文件

.PARAMETER subtitleFilePath
需要被嵌入的字幕文件

.PARAMETER outputFilePath
输出文件的位置，如果不指定则默认为原视频文件所在目录下，文件名前加0

.PARAMETER replace
布尔类型，如果为真则覆盖原有文件，否则不覆盖

.EXAMPLE
示例的说明和使用方法。可以有多个示例。

.NOTES
其他注意事项或补充说明。

#>


param(
    [Parameter(Mandatory = $true)]
    $videoFilePath,
  
    [Parameter(Mandatory = $true)]
    $subtitleFilePath,

    $outputFilePath,

    [bool]$inplace = $false,
    [bool]$copySubtitle = $true
)


# 如果未指定输出文件路径，则使用默认路径
if (-not $outputFilePath) {
    $directory = Split-Path $videoFilePath
    $filename = Split-Path $videoFilePath -Leaf
    $extension = [System.IO.Path]::GetExtension($filename)
    $extension = ".mkv"
    $basename = [System.IO.Path]::GetFileNameWithoutExtension($filename)
    $outputFilePath = Join-Path $directory ("0" + $basename + $extension)
}

$title="Chinese and Japanese"
$title = "Chinese"
$title = "Chinese and English"

Write-Host "inplace:", $inplace
Write-Host "title of subtitle:", $title

# 嵌入字幕
ffmpeg `
    -y `
    -i $videoFilePath `
    -i $subtitleFilePath `
    -map 0:v `
    -map 0:a `
    -map 1:0 `
    -map 0:s? `
    -c copy `
    -c:s copy `
    -metadata:s:s:0 language=chi `
    -metadata:s:s:0 title=$title `
    $outputFilePath

# 使新文件替换原文件
if (Test-Path -LiteralPath $outputFilePath -PathType Leaf) {

    # 不覆盖就直接退出
    if ($inplace) {
        Remove-Item -LiteralPath $videoFilePath
        Move-Item -LiteralPath $outputFilePath -Destination Join-Path $directory ($basename + $extension)
    }
    
    exit 0
}
else {
    exit 1
}