import ballerina/io;
public function main() {
    xml bookXML = xml `<book>
                <name>Sherlock Holmes</name>
                <author>
                    <fname title="Sir">Arthur</fname>
                    <mname>Conan</mname>
                    <lname>Doyle</lname>
                </author>
                <bar:year xmlns:bar="http://ballerina.com/a">2019</bar:year>
                <!--Price: $10-->
                </book>`;


    io:println(bookXML/<author>/<fname>);

    io:println(bookXML/<ISBN>/<code>);

    io:println(bookXML/<author>/<fname>.title);

    io:println(bookXML/**/<fname>);

    io:println(bookXML/*);

    io:println(bookXML/<*>);

    xmlns "http://ballerina.com/a" as bar;
    io:println(bookXML/<bar:*>/*);

    xml seq = bookXML/*;
    io:println(seq.<name>);
    io:println(seq.<bar:year>);
}
