$a = Invoke-RestMethod "https://api-launcher-static.mihoyo.com/hkrpg_cn/mdk/launcher/api/resource?key=6KcVuOkbcqjJomjZ&launcher_id=33"

$latest = $a.data.game.latest
Write-Output "# game`n`n" > .\package.md
Write-Output "`n## path`n $($latest.path)" >> .\package.md
Write-Output "`n## md5`n $($latest.md5)" >> .\package.md
Write-Output "`n# voice_packs`n" >> .\package.md
foreach ($i in $latest.voice_packs) {
    Write-Output "`n***`n## $($i.language)" >> .\package.md
    Write-Output "`n### path`n$($i.path)" >> .\package.md
    Write-Output "`n### md5 `n$($i.md5)" >> .\package.md
    Write-Output "`n" >> .\package.md
}

$diffs = $a.data.game.diffs[0]
Write-Output "`n# diff`n`n" >> .\package.md
Write-Output "## game`n`n" >> .\package.md
Write-Output "`n### path`n $($a.path)"  >> .\package.md
Write-Output "`n### md5`n $($a.md5)" >> .\package.md
Write-Output "`n## voice_packs`n`n" >> .\package.md
foreach ($i in $diffs.voice_packs) {
    Write-Output "`n***`n### $($i.language)" >> .\package.md
    Write-Output "`n#### path`n$($i.path)" >> .\package.md
    Write-Output "`n#### md5 `n$($i.md5)" >> .\package.md
    Write-Output "`n" >> .\package.md
}

