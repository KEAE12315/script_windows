for ($i = 1; $i -le 24; $i++) {
    $formattedNumber = "{0:D2}" -f $i
    $VideoFilePath = "E:\video\动漫\魔卡少女小樱\Season 3\[Yousei-raws] Cardcaptor Sakura S03E" + $formattedNumber + " [BDrip 1440x1080 x264 FLAC].mkv"
    $formattedNumber = [int]$formattedNumber + 46
    $SubtitleFilePath = "E:\video\动漫\魔卡少女小樱\[异域-11番小队][魔卡少女樱Cardcaptor Sakura][BDRIP][960X720][x264_AAC]\[YYDM-11FANS][Cardcaptor Sakura][" + $formattedNumber + "][BDRIP][960X720][X264_AAC].LITEN SAKURA-sc.ssa"

    & "E:\public warehouse\实用工具\script\film process\Embed-SoftSubtitles.ps1" -VideoFilePath $videoFilePath -SubtitleFilePath $subtitleFilePath

    # 获取退出代码
    $exitCode = $LASTEXITCODE

    # 根据退出代码的结果打印不同的消息
    switch ($exitCode) {
        0 {
            Write-Host "操作成功 $i" -ForegroundColor Green
            break
        }
        default {
            Write-Host "操作失败" -ForegroundColor Red
            Write-Host $VideoFilePath, $SubtitleFilePath
            break
        }
    }
}
