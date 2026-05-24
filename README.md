# Парадигми та технології програмування

**Студент:** Королицький Артем Сергійович  
**Група:** ТТП-32

Репозиторій містить виконані лабораторні завдання з функціонального програмування мовою **Haskell** та логічного програмування мовою **Prolog**.

## Структура

| Мова | Завдання | Розділ | Варіант | Умова |
|---|---|---:|---:|---|
| Haskell / Prolog | task 1.1 | 1 | 26 | Вилучити зі списку елементи, що мають непарну кількість входжень у список |
| Haskell / Prolog | task 1.2 | 1 | 64 | Розбити список на чотири списки за остачею від ділення на 4 |
| Haskell / Prolog | task 2 | 2 | 1 | Розбити список на впорядковані за спаданням підсписки |
| Haskell / Prolog | task 3 | 3 | 2, №1 | Виявити живі та мертві стани скінченого автомату |
| Haskell / Prolog | task 4 | 4 | 2, №1 | Виявити породжуючі та непороджуючі нетермінали і вилучити непороджуючі |
| Haskell | task 5 | 5 | (7, 8, 9), n = 9 | Maybe-функції та їх суперпозиції |
| Prolog | task 6 | 6 | літера Н | Проста експертна система для визначення тварини |

## Звіти

| Розділ | Haskell | Prolog |
|---|---|---|
| 1, задача 1 | [Звіт Haskell](haskell/task%201.1/README.md) | [Звіт Prolog](prolog/task%201.1/README.md) |
| 1, задача 2 | [Звіт Haskell](haskell/task%201.2/README.md) | [Звіт Prolog](prolog/task%201.2/README.md) |
| 2 | [Звіт Haskell](haskell/task%202/README.md) | [Звіт Prolog](prolog/task%202/README.md) |
| 3 | [Звіт Haskell](haskell/task%203/README.md) | [Звіт Prolog](prolog/task%203/README.md) |
| 4 | [Звіт Haskell](haskell/task%204/README.md) | [Звіт Prolog](prolog/task%204/README.md) |
| 5 | [Звіт Haskell](haskell/task%205/README.md) | — |
| 6 | — | [Звіт Prolog](prolog/task%206/README.md) |

## Як запускати

### Haskell
```bash
runghc main.hs
```

### Prolog
```bash
swipl -s main.pl -g main -t halt
```

У кожній папці є:

- `main.hs` або `main.pl` — код програми;
- `README.md` — умова, код і результати тестів;
- `tests.jpg` — знімок результатів тестування у стилі звіту.
