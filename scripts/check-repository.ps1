[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$requiredPaths = @(
    'README.md',
    'AGENTS.md',
    'THIRD_PARTY_NOTICES.md',
    'Code/ospos/LICENSE',
    'Code/ospos/composer.json',
    'Code/ospos/package.json',
    'Code/ospos/tests',
    'Yêu cầu/Yeucau_Project2.pdf',
    'Báo cáo/README.md',
    'docs/baseline.json',
    'docs/setup.md',
    'docs/workflow.md',
    'docs/maintenance/README.md',
    'evidence/README.md'
)

foreach ($relativePath in $requiredPaths) {
    if (-not (Test-Path -LiteralPath (Join-Path $projectRoot $relativePath))) {
        throw "Required project path is missing: $relativePath"
    }
}

if (Test-Path -LiteralPath (Join-Path $projectRoot 'Code/ospos/.git')) {
    throw 'Code/ospos must contain regular source files, not a nested Git repository.'
}

$baseline = Get-Content -LiteralPath (Join-Path $projectRoot 'docs/baseline.json') -Raw -Encoding utf8 | ConvertFrom-Json
if ($baseline.upstream_commit -notmatch '^[a-f0-9]{40}$' -or $baseline.upstream_tree -notmatch '^[a-f0-9]{40}$') {
    throw 'The upstream commit and tree must be full Git object identifiers.'
}

$baselineTree = & git -C $projectRoot rev-parse "$($baseline.baseline_tag):$($baseline.source_directory)"
if ($LASTEXITCODE -ne 0) {
    throw 'Cannot resolve the baseline tag. Fetch tags before running this check.'
}
if ($baselineTree.Trim() -ne $baseline.upstream_tree) {
    throw 'The source tree stored in the baseline tag differs from the original upstream tree.'
}

$gitlinks = @(& git -C $projectRoot ls-files --stage | Where-Object { $_ -match '^160000 ' })
if ($LASTEXITCODE -ne 0) {
    throw 'Cannot inspect tracked repository files.'
}
if ($gitlinks.Count -gt 0) {
    throw 'Unexpected Git submodule found; this repository should be self-contained.'
}

Write-Output "Repository structure and OSPOS $($baseline.version) baseline: PASS"
Write-Output 'This check does not run the application build or PHP tests.'
