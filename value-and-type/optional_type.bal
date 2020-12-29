import ballerina/io;
function getValue(string key) returns string? {
    if (key == "string") {
        return "hello world";
    }

    return ();
}

public function main() {
    string? s = getValue("string");

    if (s is string) {
        io:println("Length of the string: ", s.length());
    } else {
        io:println("s is ()");
    }

    s = ();
    if (s is string) {
        io:println("Length of the string: ", s.length());
    } else {
        io:println("s is ()");
    }
}
