Set-Location $PSScriptRoot

$a = Invoke-RestMethod "https://fixcdn.hyonsu.com/attachments/1031591699421593670/1461054418966413402/a.json" | ConvertFrom-Json

$Levels = $a.psobject.properties.name
$Achievements = @()
foreach ($Level in $Levels) {
    $Achievements += @($a.$Level)
}
for ($i = 0; $i -lt $Levels.Length; $i++) {
    New-Item -ItemType Directory "$($Levels[$i])"
    foreach ($Achievement in $Achievements[$i]) {
        New-Item -ItemType Directory "$($Levels[$i])\${Achievement}"
    }
}