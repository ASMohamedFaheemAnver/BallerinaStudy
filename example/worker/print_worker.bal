import ballerina/io;
public function main() {
    @strand {thread: "any"}
    worker w1 {
        io:println("Hello, World! #n1");
    }
    @strand {thread: "any"}
    worker w2 {
        io:println("Hello, World! #n2");
    }
    @strand {thread: "any"}
    worker w3 {
        io:println("Hello, World! #n3");
    }
}
