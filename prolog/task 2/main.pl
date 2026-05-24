% part 2. 1
% Розбити список на строго спадні підсписки.

split_descending([], []).
split_descending([H|T], Result) :-
    build_groups(T, H, [H], [], Result).

build_groups([], _, Current, Acc, Result) :-
    reverse(Current, Group),
    reverse([Group|Acc], Result).
build_groups([X|Xs], Prev, Current, Acc, Result) :-
    Prev > X,
    build_groups(Xs, X, [X|Current], Acc, Result).
build_groups([X|Xs], Prev, Current, Acc, Result) :-
    Prev =< X,
    reverse(Current, Group),
    build_groups(Xs, X, [X], [Group|Acc], Result).

show_array(List) :-
    write('['),
    write_elements(List),
    write(']').

write_elements([]).
write_elements([X]) :- write(X).
write_elements([H|T]) :-
    write(H), write(', '),
    write_elements(T).

show_2d_array(List) :-
    write('['),
    write_2d_elements(List),
    write(']').

write_2d_elements([]).
write_2d_elements([X]) :- show_array(X).
write_2d_elements([H|T]) :-
    show_array(H), write(', '),
    write_2d_elements(T).

run_test(N, Input, Expected) :-
    split_descending(Input, Result),
    format("Test ~w:~n", [N]),
    write("  Input:    "), show_array(Input), nl,
    write("  Expected: "), show_2d_array(Expected), nl,
    write("  Result:   "), show_2d_array(Result), nl,
    ( Result = Expected -> write("  PASS\n\n") ; write("  FAIL\n\n") ).

main :-
    run_test(1, [5,4,2,8,3,1,6,9,5], [[5,4,2], [8,3,1], [6], [9,5]]),
    run_test(2, [9,7,5,3], [[9,7,5,3]]),
    run_test(3, [1,2,3,4], [[1], [2], [3], [4]]),
    run_test(4, [4,4,3,2,2,1], [[4], [4,3,2], [2,1]]),
    run_test(5, [], []).
