import ballerina/http;
import ballerina/io;
public function main() returns @tainted error? {
    http:Client sunriseAPI = new ("http://api.sunrise-sunset.org");
    http:Response sunriseResp = check sunriseAPI->get("/json?lat=6.9349969&lng=79.8538463");
    json sunrisePayload = check sunriseResp.getJsonPayload();
    io:println(sunrisePayload);
}
