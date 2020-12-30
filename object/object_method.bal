import ballerina/io;

type Person object {
    public int age;
    public string firstName;
    public string lastName;

    function __init(int age, string firstName, string lastName) {
        self.age = age;
        self.firstName = firstName;
        self.lastName = lastName;
    }

    function getFullName() returns string {
        return self.firstName + " " + self.lastName;
    }
};

public function main() {
    Person p1 = new (5, "John", "Doe");
    io:println(p1.getFullName());
}
