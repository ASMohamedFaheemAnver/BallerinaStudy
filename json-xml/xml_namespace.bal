import ballerina/io;
xmlns "http://ballerina.com/aa" as ns0;
public function main() {
    xmlns "http://ballerina.com/bb" as ns1;

    xmlns "http://ballerina.com/default";

    io:println(ns0:foo);

    xmlns "http://ballerina.com/updated" as ns0;
    io:println(ns0:foo);
}
