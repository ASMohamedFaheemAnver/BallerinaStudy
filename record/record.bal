import ballerina/io;

type Student record {
    string name;
    int age;
    Grades grades;
};

type Address record {|
    string city;
    string country;
|};

type Grades record {|
    int maths;
    int physics;
    int chemistry;

    int...;
|};

public function main() {
    int age = 17;

    Student john = {
        name: "John Doe",
        age,
        grades: {
            maths: 80,
            physics: 75,
            chemistry: 65
        }
    };

    io:println(john);
    io:println(john.name);

    io:println(john["name"]);

    io:println(john.grades.maths);

    Student peter = {
        name: "Peter",
        age: 19,
        grades: {
            maths: 40,
            physics: 35,
            chemistry: 35
        }
    };
    peter.age = 16;

    io:println(peter);
    io:println(john);

    Address address = {city: "Colombo", country: "Sri Lanka"};
    peter["address"] = address;
    io:println(peter);

    Grades grades = {maths: 80, physics: 75, chemistry: 65, "english": 90};
    io:println(grades);

    int? english = grades["english"];
    io:println(english);

    Student anne = {
        name: "Anne",
        age: 18,
        grades: {
            maths: 70,
            physics: 80,
            chemistry: 55
        },
        ...address
    };
    io:println(anne);

    var rec = {name: "Amy", age: 18, ...address};
    io:println(rec);

    io:println(rec.name);
}
