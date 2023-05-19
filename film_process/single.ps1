$videoFilePath = `
"C:\Users\keae\Downloads\Ponyo.2008.JAPANESE.1080p.BluRay.x265-VXT\Ponyo.2008.JAPANESE.1080p.BluRay.x265-VXT.mp4"
$subtitleFilePath = `
"C:\Users\keae\Downloads\Ponyo.2008.JAPANESE.1080p.BluRay.x265-VXT\崖上的波妞.2008.1080P.H265.10bit.国粤日英韩五语.中日特效字幕『韩×影特效字幕公众号：Movie丶徒』.sup"

$command = "E:\public_warehouse\实用工具\script_windows\film_process\Embed-SoftSubtitles.ps1" + `
    " -videoFilePath $videoFilePath" + `
    " -subtitleFilePath $subtitleFilePath" + `
    " -inplace `$false" + `
    " -copySubtitle `$true"

Invoke-Expression -Command $command

# Invoke-Command -FilePath ".\Embed-SoftSubtitles.ps1"
