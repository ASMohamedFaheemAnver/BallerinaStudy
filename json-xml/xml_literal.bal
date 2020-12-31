import ballerina/io;
public function main() {
    xml x1 = xml `<book>
                    <name>Sherlock Holmes</name>
                    <author>Sir Arthur Conan Doyle</author>
                    <!--Price: $10-->
                  </book>`;
    io:println(x1);

    xmlns "http://ballerina.com/";
    xmlns "http://ballerina.com/aa" as ns0;

    xml x2 = xml `<book ns0:status="available">
                    <ns0:name>Sherlock Holmes</ns0:name>
                    <author>Sir Arthur Conan Doyle</author>
                    <!--Price: $10-->
                  </book>`;
    io:println(x2);

    string title = "(Sir)";

    xml x3 = xml `<ns0:newBook>
                    <name>Sherlock Holmes</name>
                    <author>${title} Arthur Conan Doyle</author>
                    <!--Price: $${40 / 5 + 4}-->
                  </ns0:newBook>`;
    io:println(x3);
}
