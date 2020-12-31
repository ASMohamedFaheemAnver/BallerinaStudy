import ballerina/io;

public type Person record {
    string name;
    int age;
    object {
        public string city;
        public string country;

        public function __init(string city, string country) {
            self.city = city;
            self.country = country;
        }
        public function value() returns string {
            return self.city + ", " + self.country;
        }
    } address;
};
public function main() {
    Person john = {
        name: "John Doe",
        age: 25,
        address: new ("Colombo", "Sri Lanka")
    };
    io:println(john.address.city);

    object {
        public string city;
        public string country;

        public function __init(string city, string country) {
            self.city = city;
            self.country = country;
        }
        public function value() returns string {
            return self.city + ", " + self.country;
        }
    } adr = new ("London", "UK");
    Person jane = {name: "Jane Doe", age: 20, address: adr};
    io:println(jane.address.country);
}
