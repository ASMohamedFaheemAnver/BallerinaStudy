import ballerina/io;
type Person object {
    public string name = "";
    public int age = 0;

    public Person? parent = ();

    private string email = "default@abc.com";

    string address = "No 20, Palm grove";
};

public function main() {
    Person p1 = new;
    io:println(p1.age);

    Person p2 = new ();
    io:println(p2.age);
    Person p3 = new Person();
    io:println(p3.age);
}
