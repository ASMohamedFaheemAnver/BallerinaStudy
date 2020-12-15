import ballerina/io;
public function main() {
    printValue("This is a sample text!");
    int result = add(5, 6);
    io:println(result);

    _ = printAndReturnValue("World!");
}

function printValue(string value) {
    io:println(value);
}
function add(int a, int b) returns int {
    return a + b;
}
function printAndReturnValue(string value) returns string {
    string t = "Hello ".concat(value);
    io:println(t);
    return t;
}
