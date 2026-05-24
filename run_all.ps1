$ErrorActionPreference = "Stop"

foreach ($command in @("runghc", "swipl")) {
    if (-not (Get-Command $command -ErrorAction SilentlyContinue)) {
        Write-Error "$command is not available in PATH."
        exit 1
    }
}

function Invoke-Task {
    param(
        [string] $Name,
        [string] $Directory,
        [string] $Command,
        [string[]] $Arguments
    )

    Write-Host ""
    Write-Host "=== $Name ==="

    Push-Location $Directory
    try {
        & $Command @Arguments
        if ($LASTEXITCODE -ne 0) {
            throw "$Name exited with code $LASTEXITCODE."
        }
    }
    catch {
        Write-Error "FAILED: $Name. $($_.Exception.Message)"
        exit 1
    }
    finally {
        Pop-Location
    }
}

Invoke-Task "Haskell task 1.1" "haskell/task 1.1" "runghc" @("main.hs")
Invoke-Task "Haskell task 1.2" "haskell/task 1.2" "runghc" @("main.hs")
Invoke-Task "Haskell task 2" "haskell/task 2" "runghc" @("main.hs")
Invoke-Task "Haskell task 3" "haskell/task 3" "runghc" @("main.hs")
Invoke-Task "Haskell task 4" "haskell/task 4" "runghc" @("main.hs")
Invoke-Task "Haskell task 5" "haskell/task 5" "runghc" @("main.hs")

Invoke-Task "Prolog task 1.1" "prolog/task 1.1" "swipl" @("-q", "-s", "main.pl", "-g", "main", "-t", "halt")
Invoke-Task "Prolog task 1.2" "prolog/task 1.2" "swipl" @("-q", "-s", "main.pl", "-g", "main", "-t", "halt")
Invoke-Task "Prolog task 2" "prolog/task 2" "swipl" @("-q", "-s", "main.pl", "-g", "main", "-t", "halt")
Invoke-Task "Prolog task 3" "prolog/task 3" "swipl" @("-q", "-s", "main.pl", "-g", "main", "-t", "halt")
Invoke-Task "Prolog task 4" "prolog/task 4" "swipl" @("-q", "-s", "main.pl", "-g", "main", "-t", "halt")
Invoke-Task "Prolog task 6" "prolog/task 6" "swipl" @("-q", "-s", "main.pl", "-g", "main", "-t", "halt")

Write-Host ""
Write-Host "All tasks passed."
