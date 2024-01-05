% Main rule reads inputs from command line calls reverselist rule and outputs the result of the now reversed list with write 
main :- read(Input),
	reverselist(Input, Result),
	write(Result).

% Initial reverselist rule that calls helper to obtain the reversed list and uses the thrird argument to hold 
reverselist(Input, ReversedList) :- 
	reverselist_helper(Input, [], ReversedList).
% Initial base case for when the list (Og list passed) is empty 
reverselist_helper([], Acc, Acc).
% Recursive helper for reveselist which takes 3 args: the list [X|XS] similar to haskell where X is the head of the list and XS is the rest of the list w/o the head X, Acc which is the accumulator where X the head of the list is passed to the back through every iteration where the list [X|XS] isnt empty
reverselist_helper([X|XS], Acc, ResultList) :-
	reverselist_helper(XS, [X|Acc], ResultList).
	
	





