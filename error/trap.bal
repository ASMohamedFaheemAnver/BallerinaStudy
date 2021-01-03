import ballerina/io;
public function main() {
    int|error result = trap divide(1, 0);
    if (result is int) {
        io:println("int result : ", result);
    } else {
        io:println("error occurred : ", result.reason());
    }
}

function divide(int a, int b) returns int {
    return a / b;
}
