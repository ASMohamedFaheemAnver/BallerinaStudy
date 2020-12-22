import ballerina/io;
public function main() {
    map<string> words = {
        a: "ant",
        b: "bear",
        c: "cat",
        d: "dear",
        e: "elephant"
    };
    io:println("Number of elements in 'words' : ", words.length());

    map<string> animals = words.map(toUpper);
    io:println(animals);

    int[] numbers = [-5, -3, 2, 7, 12];

    int[] positive = numbers.filter(function(int i) returns boolean {
        return i >= 0;
    });

    io:println("Positive numbers : ", positive);

    numbers.forEach(function(int i) {
        io:println(i);
    });

    int total = numbers.reduce(sum, 0);
    io:println("Total : ", total);

    int totalWithInitialValue = numbers.reduce(sum, 5);
    io:println("Total with initial value : ", totalWithInitialValue);

    io:println("\nExecution order : ");

    map<json> j = {name: "apple", colors: ["red", "green"], price: 5};
    j.map(function (json value) returns string {
        string result = value.toString();
        io:println("Map operation's value : ", result);
        return result;
    }).forEach(function(string s) {
        io:println("Foreach operation's value : ", s);
    });

}

function toUpper(string value) returns string {
    return value.toUpperAscii();
}

function sum(int accumulator, int currentValue) returns int {
    io:println({accumulator, currentValue});
    return accumulator + currentValue;
}
