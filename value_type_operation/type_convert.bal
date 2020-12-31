import ballerina/io;
import ballerina/lang.'decimal;
import ballerina/lang.'float;
import ballerina/lang.'int;
type Person record {
    string name;
    int age;
};
type Employee record {
    string name;
    int age;
    int empNo;
};
function convertEmployeeToPerson(Employee emp) {

    Person|error res = Person.constructFrom(emp);
    if (res is Person) {

        io:println("Employee to Person, name: ", res["name"]);
    } else {
        io:println("Error occurred on conversion");
    }
}

function convertAnydataMapToPerson(map<anydata> m) {

    Person|error res = Person.constructFrom(m);
    if (res is Person) {

        io:println("map<anydata> to Person, name: ", res["name"]);
    } else {
        io:println("Error occurred on conversion: ", res.detail());
    }
}

function createNumericValues() {
    string s1 = "45";
    string s2 = "abc";
    string s3 = "12.3";
    string s4 = "8";

    int|error res1 = 'int:fromString(s1);
    if (res1 is int) {
        io:println("int value: ", res1);
    } else {
        io:println("error: ", res1.detail());
    }

    res1 = 'int:fromString(s2);
    if (res1 is int) {
        io:println("int value: ", res1);
    } else {
        io:println("error: ", res1.detail());
    }
    float|error res2 = 'float:fromString(s3);
    if (res2 is float) {
        io:println("float value: ", res2);
    } else {
        io:println("error: ", res2.detail());
    }

    decimal|error res3 = 'decimal:fromString(s4);
    if (res3 is decimal) {
        io:println("decimal value: ", res3);
    } else {
        io:println("error: ", res3.detail());
    }
}

public function main() {
    Employee emp = {name: "Jack Sparrow", age: 54, empNo: 100};
    convertEmployeeToPerson(emp);

    map<anydata> m = {name: "Hector Barbossa", age: 54, empNo: 100};
    convertAnydataMapToPerson(m);

    map<anydata> n = {name: "Elizabeth Swann"};
    convertAnydataMapToPerson(n);

    createNumericValues();
}
