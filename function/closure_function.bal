import ballerina/io;

int globalA = 5;

function basicClosure() returns (function (int) returns int) {
    int a = 3;
    var foo = function (int b) returns int {
        int c = 34;
        if (b == 3) {
            c = c + b + globalA;
        }
        return c + a;
    };
    return foo;
}

function multilevelClosure() returns (function (int) returns int) {
    int a = 2;
    var funOne = function (int x) returns int {
        int b = 23;
        a = a + 8;
        var funTwo = function (int y) returns int {
            int c = 7;
            var funThree = function (int z) returns int {
                b = b + 1;
                return x + y + z + a + b + c;
            };
            return funThree(8) + y + x;
        };
        return funTwo(4) + x;
    };
    return funOne;
}

function functionPointers(int a) returns (function (int) returns (function (int) returns int)) {
    return function (int b) returns (function (int) returns int) {
        return function (int c) returns int {
            return a + b + c;
        };
    };
}

public function main() {
    var foo = basicClosure();
    int result = foo(3);
    io:println("Answer : ", result);

    var bar = multilevelClosure();
    int result2 = bar(5);
    io:println("Answer : ", result2);

    var baz = functionPointers(7);
    var baz2 = baz(5);
    int result3 = baz2(3);
    io:println("Answer : ", result3);
}
