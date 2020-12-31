import ballerina/io;
import ballerina/lang.'int;
function parse(string num) returns int|error {
    return 'int:fromString(num);
}

function scale(string num) returns int|error {
    int x = check parse(num);
    return x * 10;
}

public function main() {
    int|error w = parse("12");
    io:println(w);

    int|error x = parse("invalid");
    io:println(x);

    int|error y = scale("12");
    io:println(y);
    int|error z = scale("Invalid");
    io:println(z);
}
