import ballerina/io;
public function main() {
    map<string|int> m1 = {stringVal: "str", intVal: 1};

    map<string|int> m2 = m1.cloneReadOnly();

    io:println("m1 === m2: ", m1 === m2);

    io:println("m1 is immutable: ", m1.isReadOnly());

    io:println("m2 is immutable: ", m2.isReadOnly());

    error? updateResult = trap addEntryToMap(m2, "intValTwo", 10);
    if (updateResult is error) {

        io:println("Error occurred on update: ",
            <string>updateResult.detail()?.message);
    }

    map<string|int> m3 = m2.cloneReadOnly();

    io:println("m2 === m3: ", m2 === m3);

    map<string|int> m5 = {valueType: "map", constraint: "string"};

    var frozenVal = m5.cloneReadOnly();

    if (frozenVal is map<string>) {
        io:println("frozenVal is map<string>");
    }
}

function addEntryToMap(map<string|int> m, string key, string|int value) {
    m[key] = value;
}
