import ballerina/io;
import ballerina/lang.'xml as xmllib;
public function main() {
    xml bookName = xml `<name>Book1</name>`;
    xml bookComment = xml `<!--some comment-->`;
    xml someText = xml `Hello, World!`;
    xml content = someText + bookName + bookComment;
    xmllib:Element book = <xmllib:Element>xml `<book/>`;
    xmllib:Element bookNameElem = <xmllib:Element>bookName;
    io:println(bookNameElem.getName());

    xml concat = xmllib:concat(someText, bookName, bookComment);
    io:println(concat);
    io:println(content == concat);

    io:println(concat.length());

    xml x = content.slice(2, 3);
    io:println(x);

    x = content.elements();
    io:println(x);

    book.setChildren(content);
    io:println(book);

    x = content.strip();
    io:println(x);
}
