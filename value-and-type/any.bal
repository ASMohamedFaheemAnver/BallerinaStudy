import ballerina/io;
type Person object {
    string fname;
    string lname;
    function __init(string fname, string lname) {
        self.fname = fname;
        self.lname = lname;
    }
    function getFullName() returns string {
        return self.fname + " " + self.lname;
    }
};
function getValue() returns any {
    string name = "cat";
    return name;
}

public function main() {
    any a = new Person("John", "Doe");

    Person john = <Person>a;
    io:println("Full name: ", john.getFullName());

    if (a is Person) {
        io:println("First name: ", john.fname);
    }
    int[] ia = [1, 3, 5, 6];
    any ar = ia;
    io:println(ar);

    io:println(getValue());
}
