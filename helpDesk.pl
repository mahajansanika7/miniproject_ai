% Facts
issue(1, "Printer not working", high, open).
issue(2, "Cannot login to system", high, open).
issue(3, "Email not sending", medium, open).
issue(4, "Forgot password", low, open).

% Rules
priority(high, 1).
priority(medium, 2).
priority(low, 3).

% Rules to manage issues
manage_issues :-
    writeln("Welcome to the Help Desk Management System"),
    writeln("1. View Open Issues"),
    writeln("2. Close an Issue"),
    writeln("3. Exit"),
    read_choice.

read_choice :-
    write("Enter your choice: "),
    read(Choice),
    process_choice(Choice).

process_choice(1) :-
    view_open_issues,
    manage_issues.
process_choice(2) :-
    close_issue,
    manage_issues.
process_choice(3) :-
    writeln("Exiting...").

view_open_issues :-
    writeln("Open Issues:"),
    forall(issue(ID, Description, Priority, Status),
           (Status == open,
            format("ID: ~w, Description: ~w, Priority: ~w~n", [ID, Description, Priority]))),
    fail.
view_open_issues :-
    writeln("No open issues found.").

close_issue :-
    writeln("Enter the ID of the issue to close: "),
    read(ID),
    retract(issue(ID, _, _, _)),
    assertz(issue(ID, _, _, closed)),
    writeln("Issue closed successfully.").
