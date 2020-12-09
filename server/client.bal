import ballerina/http;
import ballerina/io;
public function main() returns @tainted error? {
    http:Client xclient = new ("http://localhost:8080/init");
    http:Response response = check xclient->get("/responseMethod");
    io:println(check response.getTextPayload());
}
