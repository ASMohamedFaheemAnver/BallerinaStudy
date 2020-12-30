import ballerina/io;
type Person object {
    public string name;
    private int age;

    function __init(string name, int age) returns error? {
        self.name = name;
        self.age = check validateAge(age);
    }
};
function validateAge(int age) returns int|error {
    if (age > 0 && age < 100) {
        return age;
    }
    error invalidAge = error("The age should be between 0-100");
    return invalidAge;
}

public function main() {
    Person|error p1 = new ("John", 25);
    if (p1 is Person) {
        io:println(p1.name);
    } else {
        io:println(p1.reason());
    }

    Person|error p2 = new ("Sam", -20);
    if (p2 is Person) {
        io:println(p2.name);
    } else {
        io:println(p2.reason());
    }
}
