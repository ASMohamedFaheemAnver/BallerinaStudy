import ballerina/io;
import ballerina/lang.'xml as xmllib;
xmlns "http://ballerina.com/aa" as ns0;
public function main() {
    xmllib:Element x1 = <xmllib:Element>xml `<ns0:book ns0:status="available" count="5"/>`;
    io:println(x1);

    io:println(x1.ns0:status);

    string|error count = x1.count;
    io:println(count);

    string|error count2 = x1.count2;
    io:println(count2 is error);

    map<string> attributeMap = x1.getAttributes();
    io:println(attributeMap);

    string? s = attributeMap["{http://ballerina.com/aa}status"];
    io:println(s);

    attributeMap[ns0:status] = "Not Available";
    io:println(x1.ns0:status);
}
