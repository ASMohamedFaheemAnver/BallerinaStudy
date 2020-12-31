import ballerina/io;
type Person record {
    string fname;
    string lname;
    int age;
};

type Movie record {
    string title;
    string year;
    string released;
    Person writer;
};
public function main() {
    Movie theRevenant = {
        title: "The Revenant",
        year: "2015",
        released: "08 Jan 2016",
        writer: {
            fname: "Michael",
            lname: "Punke",
            age: 30
        }
    };
    json|error j = json.constructFrom(theRevenant);
    if (j is json) {
        io:println(j.toJsonString());
        io:println(j.writer.lname);
    }

    map<anydata>|error movieMap = map<anydata>.constructFrom(theRevenant);
    if (movieMap is map<anydata>) {
        Person|error writer = Person.constructFrom(movieMap["writer"]);
        if (writer is Person) {
            io:println(writer.age);
        }
    }

    json inceptionJ = {
        title: "Inception",
        year: "2010",
        released: "16 Jul 2010",
        writer: {
            fname: "Christopher",
            lname: "Nolan",
            age: 30
        }
    };
    Movie|error inception = Movie.constructFrom(inceptionJ);
    if (inception is Movie) {
        io:println(inception);
    }
