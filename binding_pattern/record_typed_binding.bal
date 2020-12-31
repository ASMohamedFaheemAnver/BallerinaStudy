import ballerina/io;
type Person record {
    string name;
    int age;
    string country;
};
type Country record {
    string name;
    Capital capital;
};
type Capital record {|
    string name;
|};
public function main() {
    Person {name: firstName, age: personAge, ...otherDetails} = getPerson();
    io:println("Name: ", firstName);
    io:println("Age: ", personAge);
    io:println("Other Details: ", otherDetails);

    Person {name, age} = getPerson();
    io:println("Name: ", name);
    io:println("Age: ", age);

    var {name: vFirstName, age: vPersonAge, ...vOtherDetails} = getPerson();

    io:println("Name: ", vFirstName);

    io:println("Age: ", vPersonAge);

    io:println("Other Details: ", vOtherDetails);

    var {name: countryName, capital: {name: capitalName}} = getCountry();
    io:println("Country Name: ", countryName);
    io:println("Capital Name: ", capitalName);
}

function getPerson() returns Person {
    Person person = {
        name: "Peter",
        age: 28,
        country: "Sri Lanka",
        "occupation": "Software Engineer"
    };
    return person;
}
function getCountry() returns Country {
    Capital capital = {name: "Colombo"};
    Country country = {name: "Sri Lanka", capital: capital};
    return country;
}
