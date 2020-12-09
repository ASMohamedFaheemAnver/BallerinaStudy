import ballerina/http;
import ballerina/io;

service init on new http:Listener(8080) {
    resource function responseMethod(http:Caller caller, http:Request request) {
        error? result = caller->respond("Server is up and running!");

        if (result is error) {
            io:println("Error in responding : ", result);
        }
    }
}
