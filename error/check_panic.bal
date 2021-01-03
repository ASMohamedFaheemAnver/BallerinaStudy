import ballerina/io;
import ballerina/lang.'int;

function parse(string num) returns int|error {
    return 'int:fromString(num);
}

public function main() {
    int y = checkpanic parse("120");
    io:println(y);

    int z = checkpanic parse("invalid");
    io:println(z);
}
