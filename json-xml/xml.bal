import ballerina/io;
public function main() {
    xml x1 = xml `<book>The Lost World</book>`;
    io:println(x1);

    xml x2 = xml `Hello, world!`;
    io:println(x2);

    xml x3 = xml `<!--I am a comment-->`;
    io:println(x3);

    xml x4 = xml `<?target data?>`;
    io:println(x4);

    xml x5 = x1 + x2 + x3 + x4;
    io:println("\nResulting XML sequence:");
    io:println(x5);
}
