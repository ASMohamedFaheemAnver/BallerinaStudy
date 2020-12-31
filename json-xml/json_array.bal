import ballerina/io;
public function main() {
    json j1 = [1, false, null, "foo", {first: "John", last: "Pala"}];
    io:println(j1.toJsonString());

    json[] j2 = <json[]>j1;
    json j3 = j2[4];
    io:println(j3.toJsonString());

    j2[4] = 8.00;
    io:println(j1.toJsonString());

    map<json> p = {
        fname: "John",
        lname: "Stallone",
        family: [
                {fname: "Peter", lname: "Stallone"},
                {fname: "Emma", lname: "Stallone"},
                {fname: "Jena", lname: "Stallone"},
                {fname: "Paul", lname: "Stallone"}
            ]
    };

    json[] family = <json[]>p["family"];
    map<json> member2 = <map<json>>family[2];
    member2["fname"] = "Alisha";
    io:println(p.toJsonString());
    int l = family.length();
    io:println("length of the array: ", l);

    int i = 0;
    while (i < l) {
        io:println(family[i].toJsonString());
        i = i + 1;
    }
}
