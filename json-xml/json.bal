import ballerina/io;
public function main() {
    json j1 = "Apple";
    io:println(j1);

    json j2 = 5.36;
    io:println(j2);

    json j3 = true;
    io:println(j3);

    json j4 = false;
    io:println(j4);

    json j5 = null;

    json j6 = {name: "apple", color: "red", price: j2};
    io:println(j6);

    io:println(j6.toJsonString());

    json j7 = [1, false, null, "foo", {first: "John", last: "Pala"}];
    io:println(j7.toJsonString());

    json j8 = checkpanic j5.mergeJson(j7);
    io:println(j8.toJsonString());

    json j9 = {name: "Anne", age: null, marks: {math: 90, language: 95}};
    json j10 = {name: (), age: 20, marks: {physics: 85}};
    json j11 = checkpanic j9.mergeJson(j10);
    io:println(j11.toJsonString());

    io:println(j9 === j11);

    json|error j12 = j2.mergeJson(j3);
    io:println(j12);

    string s = j6.toJsonString();
    json j13 = checkpanic s.fromJsonString();
    io:println(j13.toJsonString());

    io:println(j6 == j13);
}
