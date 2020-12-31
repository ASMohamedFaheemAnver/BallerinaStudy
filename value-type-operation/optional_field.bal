import ballerina/io;
type Address record {
    string line01;
    string line02;
    string city;
    string state;
    string zipcode;
};
type Person record {
    string name;
    int age?;
    Address? addr;
};

function getPerson(string name, int age) returns Person? {
    if (name == "" || age == 0) {
        return;
    } else {

        Person p = {
            name: name,
            age: age,
            addr: {
                line01: "No. 61",
                line02: "Brandon street",
                city: "Santa Clara",
                state: "CA",
                zipcode: "95134"
            }
        };
        return p;
    }
}

public function main() {
    Person p1 = {name: "Anne", addr: ()};

    int? age = p1?.age;
    io:println("Age: ", age);

    p1 = {name: "Anne", age: 24, addr: ()};

    age = p1?.age;
    io:println("Age: ", age);

    Person? p2 = getPerson("John", 30);
    io:println(p2);
    string? city1 = p2?.addr?.city;

    io:println(city1);

    Person? p3 = getPerson("", 0);

    string? city2 = p3?.addr?.city;
    io:println(city2);

    p3 = {name: "George", age: 20, addr: ()};

    city2 = p3?.addr?.city;
    io:println(city2);

    string defaultCity = "San Jose";
    string city = city2 ?: defaultCity;
    io:println(city);
}
