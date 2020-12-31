import ballerina/io;
public type Person record {
    string name;
    int age;
    boolean married;
    float salary;
    Address address;
};

public type Address record {
    string country;
    string state;
    string city;
    string street;
};

public function main() {
    Address address = {
        country: "USA",
        state: "NC",
        city: "Raleigh",
        street: "Daniels St"
    };

    Person person = {
        name: "Alex",
        age: 24,
        married: false,
        salary: 8000.0,
        address: address
    };

    Person result = person.clone();

    io:println("Source value: ", person);
    io:println("Cloned value: ", result);
    io:println("Source and Clone are at two different memory locations: ", result !== person);
}
