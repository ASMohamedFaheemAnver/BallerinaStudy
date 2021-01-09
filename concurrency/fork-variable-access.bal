import ballerina/io;
public function main() {
    int i = 100;
    string s = "wso2";
    map<string> m = {"name": "Bert", "city": "New york", "postcode": "10001"};

    string name = <string>m["name"];
    string city = <string>m["city"];
    string postcode = <string>m["postcode"];

    io:println("[value type variables] before fork: " +
        "value of integer variable is [", i, "] ",
        "value of string variable is [", s, "]");

    io:println("[reference type variables] before fork: value " +
        "of name is [", name, "] value of city is [", city, "] value of " +
        "postcode is [", postcode, "]");


    fork {
        worker w1 {
            i = 23;
            m["name"] = "Moose";

            fork {
                worker w3 {
                    string street = "wall street";
                    m["street"] = street;

                    i = i + 100;
                }
            }

                wait w3;
        }
        worker w2 {
            s = "ballerina";
            m["city"] = "manhattan";
        }
    }

    _ = wait {w1, w2};

    io:println("[value type variables] after fork: " +
        "value of integer variable is [", i, "] ",
        "value of string variable is [", s, "]");

    name = <string>m["name"];
    city = <string>m["city"];

    string street = <string>m["street"];
    io:println("[reference type variables] after fork: " +
        "value of name is [", name,
        "] value of city is [", city, "] value of street is [", street,
        "] value of postcode is [", postcode, "]");
}
