Param(
  [string]$Root = "G:\<locaion>"
)

function Write-FilesJson($dir) {
  $items = Get-ChildItem -LiteralPath $dir | Where-Object { $_.Name -ne 'files.json' -and $_.Name -ne 'assets' -and $_.Name -ne 'index.html' } |
    ForEach-Object {
      [PSCustomObject]@{
        name  = $_.Name
        href  = $_.Name
        isDir = $_.PSIsContainer
        size  = if ($_.PSIsContainer) { $null } else { $_.Length }
        mtime = $_.LastWriteTimeUtc.ToString("o")
      }
    } | Sort-Object -Property @{Expression={$_.isDir};Descending=$true}, name

  $outPath = Join-Path $dir 'files.json'
  $items | ConvertTo-Json -Depth 3 | Out-File -FilePath $outPath -Encoding UTF8
  Write-Host "Generated $outPath with $($items.Count) entries"
}

# Generate for root and all subfolders
Get-ChildItem -LiteralPath $Root -Directory -Recurse -Force | ForEach-Object {
  Write-FilesJson $_.FullName
}
Write-FilesJson $Root
