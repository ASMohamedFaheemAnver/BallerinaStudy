import ballerina/io;
function add(int a, int b) returns int => a + b;

type Person record {|
    string fname;
    string lname;
    int age;
|};

type Employee record {|
    string name;
    string designation;
|};


public function main() {
    int sum = add(10, 30);

    var toEployee = function (Person p, string pos) returns Employee => {
        name: p.fname + " " + p.lname,
        designation: pos
    };

    Person john = {fname: "John", lname: "Doe", age: 25};
    Employee johnEmp = toEployee(john, "Software Engineer");

    io:println(johnEmp);
}
