import ballerina/io;
public function main() {
    string name = "Ballerina";
    string template = string `Hello ${name}!!!`;

    io:println(template);
}
