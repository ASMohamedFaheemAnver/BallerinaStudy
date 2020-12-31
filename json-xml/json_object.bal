import ballerina/io;
public function main() {
    json j = {name: "apple", color: "red", price: 100};
    io:println(j.toJsonString());

    io:println("j is map<json>: ", j is map<json>);

    json empty = {};

    int age = 30;
    json p = {fname: "John", lname: "Stallone", "age": age};
    io:println(p.toJsonString());

    map<json> mp = <map<json>>p;
    mp["age"] = 31;
    io:println(p.toJsonString());

    map<json> p2 = {
        fname: "Peter",
        lname: "Stallone",
        address: {
            line: "20 Palm Grove",
            city: "Colombo 03",
            country: "Sri Lanka"
        }
    };
    io:println(p2.toJsonString());

    json lastName = p2["lname"];
    io:println(lastName);
}
