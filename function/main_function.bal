import ballerina/io;

public function main(string name, int age = 18, string year = "Freshman", string... modules) returns error? {
    if (name.length() < 5) {
        error e = error("Invalid name", message = "Invalid length");
        return e;
    }

    string info = string `Name: ${name}, Age: ${age}, Year: ${year}`;

    if (modules.length() > 0) {
        info += ", Module(s): " + modules.toString();
    }

    io:println(info);
}
