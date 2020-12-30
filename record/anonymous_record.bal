import ballerina/io;
public type Person record {
    string name;
    int age;
    record {|
        string city;
        string country;
    |} address;
};

public function main() {
    Person john = {
        name: "John Doe",
        age: 25,
        address: {
            city: "Colombo",
            country: "Sri lanka"
        }
    };

    record {|
        string city;
        string country;
    |} adr = {city: "London", country: "UK"};

    Person jane = {name: "Jane Doe", age: 20, address: adr};
    io:println(jane);

    anydata[] fields = toFieldsArray(john);
    io:println(fields);
}

function toFieldsArray(record {} anydataRecord) returns anydata[] {
    anydata[] fields = [];

    foreach var recField in anydataRecord {
        fields.push(recField);
    }

    return fields;
}
