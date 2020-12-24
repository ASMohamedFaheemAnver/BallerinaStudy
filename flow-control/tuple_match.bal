import ballerina/io;
public function main() {
    [string, int]|[float, string, boolean]|float a1 = 66.6;
    [string, int]|[float, string, boolean]|float a2 = ["Hello", 12];
    [float, boolean]|[float, string, boolean]|float a3 = [4.5, true];
    [string, int]|[float, string, boolean]|float a4 = [6.7, "Test", false];

    basicMatch(a1);
    basicMatch(a2);
    basicMatch(a3);
    basicMatch(a4);

    [string, int]|[boolean, int]|[int, boolean]|int|float b1 = ["Hello", 45];
    [string, int]|[float, boolean]|[int, boolean]|int|float b2 = [4.5, true];
    [float, boolean]|[boolean, int]|[int, boolean]|int|float b3 = [false, 4];
    [string, int]|[int, boolean]|int|float b4 = [455, true];
    [float, boolean]|[boolean, int]|[int, boolean]|float b5 = 5.6;

    matchWithMatchGuard(b1);
    matchWithMatchGuard(b2);
    matchWithMatchGuard(b3);
    matchWithMatchGuard(b4);
    matchWithMatchGuard(b5);
}

function basicMatch(any a) {
    match a {
        var [s, i, b] => {
            io:println("Matched with three vars : ", io:sprintf("%s", a));
        }

        var [s, i] => {
            io:println("Matched with two vars : ", io:sprintf("%s", a));
        }

        var s => {
            io:println("Matched with single var : ", io:sprintf("%s", a));
        }
    }
}

function matchWithMatchGuard(any b) {
    match b {
        var [s, i] if (s is string && i is int) => {
            io:println("'s' is string and 'i' is int : ", io:sprintf("%s", b));
        }

        var [s, i] if s is float => {
            io:println("Only 's' is float : ", io:sprintf("%s", b));
        }

        var [s, i] if i is int => {
            io:println("Only 'i' is int : ", io:sprintf("%s", b));
        }

        var [s, i] => {
            io:println("No type guard : ", io:sprintf("%s", b));
        }

        var s if s is float => {
            io:println("'s' is float only : ", io:sprintf("%s", b));
        }
    }
}
