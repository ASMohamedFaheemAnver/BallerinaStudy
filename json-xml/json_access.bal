import ballerina/io;
public function main() {
    json j1 = {
        fname: "Mary",
        lname: "Jane",
        address: {
            line: "20 Palm Grove",
            city: "Colombo 03",
            country: "Sri Lanka"
        }
    };

    json|error r1 = j1.fname;

    io:println(r1);

    json|error r2 = j1.address.city;

    io:println(r2);

    json|error r3 = j1.age.year;

    io:println(r3);

    json|error r4 = j1?.age?.year;

    io:println(r4);

    json j2 = null;
    json|error r5 = j2?.name;

    io:println(r5);
}
