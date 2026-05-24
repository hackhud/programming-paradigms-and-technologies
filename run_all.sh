#!/usr/bin/env sh

set -u

if ! command -v runghc >/dev/null 2>&1; then
    echo "ERROR: runghc is not available in PATH."
    exit 1
fi

if ! command -v swipl >/dev/null 2>&1; then
    echo "ERROR: swipl is not available in PATH."
    exit 1
fi

run_task() {
    name=$1
    directory=$2
    shift 2

    echo
    echo "=== $name ==="
    if ! (cd "$directory" && "$@"); then
        echo "FAILED: $name"
        exit 1
    fi
}

run_task "Haskell task 1.1" "haskell/task 1.1" runghc main.hs
run_task "Haskell task 1.2" "haskell/task 1.2" runghc main.hs
run_task "Haskell task 2" "haskell/task 2" runghc main.hs
run_task "Haskell task 3" "haskell/task 3" runghc main.hs
run_task "Haskell task 4" "haskell/task 4" runghc main.hs
run_task "Haskell task 5" "haskell/task 5" runghc main.hs

run_task "Prolog task 1.1" "prolog/task 1.1" swipl -q -s main.pl -g main -t halt
run_task "Prolog task 1.2" "prolog/task 1.2" swipl -q -s main.pl -g main -t halt
run_task "Prolog task 2" "prolog/task 2" swipl -q -s main.pl -g main -t halt
run_task "Prolog task 3" "prolog/task 3" swipl -q -s main.pl -g main -t halt
run_task "Prolog task 4" "prolog/task 4" swipl -q -s main.pl -g main -t halt
run_task "Prolog task 6" "prolog/task 6" swipl -q -s main.pl -g main -t halt

echo
echo "All tasks passed."
