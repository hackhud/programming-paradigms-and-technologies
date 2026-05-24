# Парадигми та технології програмування

**Студент:** Королицький Артем Сергійович  
**Група:** ТТП-32

Репозиторій містить виконані завдання з функціонального програмування мовою **Haskell** та логічного програмування мовою **Prolog**. Проєкт не потребує Cabal або Stack: для запуску достатньо `runghc` та `swipl`.

## Завдання

Усі команди нижче виконуються з кореня репозиторію.

| Мова | Папка | Варіант | Коротка формулювання | Команда запуску |
|---|---|---|---|---|
| Haskell | [`haskell/task 1.1`](haskell/task%201.1/README.md) | Розділ I-a, №26 | Вилучити елементи з непарною кількістю входжень | `cd "haskell/task 1.1" && runghc main.hs` |
| Prolog | [`prolog/task 1.1`](prolog/task%201.1/README.md) | Розділ I-a, №26 | Вилучити елементи з непарною кількістю входжень | `cd "prolog/task 1.1" && swipl -q -s main.pl -g main -t halt` |
| Haskell | [`haskell/task 1.2`](haskell/task%201.2/README.md) | Розділ I-b, №64 | Розділити цілі числа на чотири списки за остачею від ділення на 4 | `cd "haskell/task 1.2" && runghc main.hs` |
| Prolog | [`prolog/task 1.2`](prolog/task%201.2/README.md) | Розділ I-b, №64 | Розділити цілі числа на чотири списки за остачею від ділення на 4 | `cd "prolog/task 1.2" && swipl -q -s main.pl -g main -t halt` |
| Haskell | [`haskell/task 2`](haskell/task%202/README.md) | Розділ II, №1 | Розбити список на строго спадні підсписки | `cd "haskell/task 2" && runghc main.hs` |
| Prolog | [`prolog/task 2`](prolog/task%202/README.md) | Розділ II, №1 | Розбити список на строго спадні підсписки | `cd "prolog/task 2" && swipl -q -s main.pl -g main -t halt` |
| Haskell | [`haskell/task 3`](haskell/task%203/README.md) | Розділ III, варіант 2, №1 | Виявити живі та мертві стани скінченного автомата | `cd "haskell/task 3" && runghc main.hs` |
| Prolog | [`prolog/task 3`](prolog/task%203/README.md) | Розділ III, варіант 2, №1 | Виявити живі та мертві стани скінченного автомата | `cd "prolog/task 3" && swipl -q -s main.pl -g main -t halt` |
| Haskell | [`haskell/task 4`](haskell/task%204/README.md) | Розділ IV, варіант 2, №1 | Виявити та вилучити непороджуючі нетермінали відносно стартового символу | `cd "haskell/task 4" && runghc main.hs` |
| Prolog | [`prolog/task 4`](prolog/task%204/README.md) | Розділ IV, варіант 2, №1 | Виявити та вилучити непороджуючі нетермінали відносно стартового символу | `cd "prolog/task 4" && swipl -q -s main.pl -g main -t halt` |
| Haskell | [`haskell/task 5`](haskell/task%205/README.md) | Розділ V, №7, 8, 9; `n = 9` | Реалізувати Maybe-функції та їх суперпозиції | `cd "haskell/task 5" && runghc main.hs` |
| Prolog | [`prolog/task 6`](prolog/task%206/README.md) | Розділ VI, літера Н | Побудувати експертну систему для визначення тварини | `cd "prolog/task 6" && swipl -q -s main.pl -g main -t halt` |

## Швидка перевірка всіх задач

Linux/macOS:

```bash
./run_all.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\run_all.ps1
```

Обидва скрипти послідовно запускають усі self-tests і зупиняються з повідомленням, якщо певна задача завершується з помилкою.

## Структура звітів

У кожній папці завдання є:

- `main.hs` або `main.pl` — реалізація та self-tests;
- `README.md` — умова, опис алгоритму, очікувані результати та пояснення тестів;
- `tests.jpg` — лише ілюстрація одного запуску для звіту.

Основна перевірка виконується запуском коду або загальних скриптів. Зображення `tests.jpg` не замінюють виконання self-tests.
