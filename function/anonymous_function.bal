import ballerina/io;
public function main() {
    var anonFunction = function(string x, string y) returns string {
        return x + y;
    };

    io:println("Output : ", anonFunction("Hello ", "World.!!!"));

    var anonFunctionTwo = function (string x, string y, string... z) returns string {
        string value = x + y;
        foreach var item in z {
            value += item;
        }
        return value;
    };
    io:println("Output : ", anonFunctionTwo("Ballerina ", "is ", "an ", "open ", "source ", "programming ", "language."));

    function(string, string) returns string arrowExpr = (x, y) => x + y;
    io:println("Output : ", arrowExpr("Hello ", "World.!!!"));
}
