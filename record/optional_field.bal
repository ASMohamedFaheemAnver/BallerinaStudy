import ballerina/io;
type Gender "male"|"female";

type Person record {
    string fname;
    string lname = "";
    Gender gender;
    int age?;
};

public function main() {
    Person john = {fname: "John", gender: "male"};
    io:println("Person with the non-defaultable required field set : ", john);
    int? age = john?.age;
    io:println("Age before setting : ", age);

    john.age = 25;
    age = john?.age;
    io:println("Age after setting: ", age);

    Person jane = {fname: "Jane", lname: "Doe", gender: "female"};
    io:println("Person with values assigned to required fields: ", jane);
}
