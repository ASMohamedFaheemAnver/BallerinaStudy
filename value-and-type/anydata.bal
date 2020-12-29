import ballerina/io;
function getValue() returns anydata {
    string name = "cat";
    return name;
}

public function main() {
    anydata a = 5;
    io:println(a);

    int intVal = <int>a;
    io:println(intVal + 10);

    if (a is int) {
        io:println(a + 20);
    }
    int[] ia = [1, 3, 5, 6];
    anydata ar = ia;
    io:println(ar);

    io:println(getValue());
}
