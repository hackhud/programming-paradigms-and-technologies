# Команди запуску

Потрібні інструменти:

- `runghc` для Haskell;
- `swipl` для Prolog.

## Усі задачі

Linux/macOS:

```bash
./run_all.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\run_all.ps1
```

## Окрема задача

Команди виконуються з кореня репозиторію:

```bash
cd "haskell/task 1.1" && runghc main.hs
cd "prolog/task 1.1" && swipl -q -s main.pl -g main -t halt
```

Повний перелік команд наведено у кореневому [`README.md`](README.md).
