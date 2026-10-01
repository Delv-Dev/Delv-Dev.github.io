# Regenerate static project pages from the Markdown files in projects/content.
$ErrorActionPreference = 'Stop'
function Format-Inline([string]$value) {
  $encoded = [System.Net.WebUtility]::HtmlEncode($value)
  $encoded = [regex]::Replace($encoded, '\*\*(.+?)\*\*', '<strong>$1</strong>')
  return [regex]::Replace($encoded, '\[([^\]]+)\]\((https://[^\s)]+)\)', '<a href="$2">$1 ↗</a>')
}
foreach ($source in Get-ChildItem -LiteralPath "$PSScriptRoot/content" -Filter '*.md') {
  $slug = $source.BaseName
  $lines = Get-Content -Encoding UTF8 -LiteralPath $source.FullName
  $title = $lines[0].Substring(2)
  $safeTitle = [System.Net.WebUtility]::HtmlEncode($title)
  $body = [System.Text.StringBuilder]::new()
  $navigation = [System.Text.StringBuilder]::new()
  $inSection = $false
  $inList = $false
  foreach ($raw in $lines | Select-Object -Skip 1) {
    $line = $raw.Trim()
    if ($inList -and -not $line.StartsWith('- ')) { [void]$body.AppendLine('</ul>'); $inList = $false }
    if (-not $line) { continue }
    if ($line.StartsWith('## ')) {
      if ($inSection) { [void]$body.AppendLine('</section>') }
      $heading = $line.Substring(3)
      $id = [regex]::Replace($heading.ToLowerInvariant(), '[^a-z0-9]+', '-').Trim('-')
      [void]$navigation.AppendLine("<a href=`"#$id`">$heading</a>")
      [void]$body.AppendLine("<section class=`"case-section`" id=`"$id`"><h2>$heading</h2>")
      $inSection = $true
      if ($id -eq 'gameplay-video') {
        [void]$body.AppendLine("<figure class=`"case-preview`"><img src=`"../assets/$slug.gif`" alt=`"$safeTitle gameplay preview`" loading=`"lazy`"><figcaption>Gameplay preview · GIF</figcaption></figure><p class=`"case-note`">Video not yet available. Planned video content:</p>")
      }
    } elseif ($line.StartsWith('### ')) {
      [void]$body.AppendLine('<h3>' + (Format-Inline $line.Substring(4)) + '</h3>')
    } elseif ($line.StartsWith('- ')) {
      if (-not $inList) { [void]$body.AppendLine('<ul>'); $inList = $true }
      [void]$body.AppendLine('<li>' + (Format-Inline $line.Substring(2)) + '</li>')
    } else {
      $class = if ($line -match '\[.*(?:confirm|added).*\]') { ' class="case-note"' } elseif ($line.Contains('→')) { ' class="gameplay-loop"' } else { '' }
      [void]$body.AppendLine("<p$class>" + (Format-Inline $line) + '</p>')
    }
  }
  if ($inList) { [void]$body.AppendLine('</ul>') }
  if ($inSection) { [void]$body.AppendLine('</section>') }
  $page = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="$safeTitle — game design case study by Delvin Susilo.">
  <title>$safeTitle | Delvin Susilo</title>
  <link rel="stylesheet" href="../style.css">
</head>
<body class="project-page">
  <a class="skip-link" href="#case-content">Skip to case study</a>
  <main class="project-detail case-study" aria-labelledby="game-title">
    <a class="back-link" href="../index.html#projects">← Back to projects</a>
    <header class="detail-header">
      <p class="eyebrow">Delvin Susilo · Game Design Case Study</p>
      <h1 id="game-title">$safeTitle</h1>
    </header>
    <div class="case-layout">
      <nav class="case-nav" aria-label="Case study sections">
        <p class="eyebrow">On this page</p>
        $navigation
      </nav>
      <div class="case-content" id="case-content" tabindex="-1">
        $body
        <a class="back-link" href="../index.html#projects">← Back to projects</a>
      </div>
    </div>
  </main>
</body>
</html>
"@
  Set-Content -Encoding UTF8 -LiteralPath "$PSScriptRoot/$slug.html" -Value $page
  Write-Output "Generated $slug.html"
}
