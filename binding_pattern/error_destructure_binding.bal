import ballerina/io;
type SampleErrorData record {
    string message?;
    error cause?;
    string info;
    boolean fatal;
};
type SampleError error<string, SampleErrorData>;
public function main() {
    string reason;
    string info;
    boolean fatal;
    error (reason, info = info, fatal = fatal) = getSampleError();
    io:println("Reason String: " + reason);
    io:println("Info: ", info);
    io:println("Fatal: ", fatal);

    string reasonTwo;
    map<anydata|error> params;
    error (reasonTwo, ...params) = getSampleError();
    io:println("Reason String: ", reasonTwo);
    io:println("Detail Map: ", params);


    string? detailMsg;
    error (_, detailMsg = detailMsg) = getRecordConstrainedError();
    io:println("Detail Message: ", detailMsg);
}

function getSampleError() returns SampleError {
    SampleError e = error("Sample Error", info = "Detail Info", fatal = true);
    return e;
}
type Foo record {|
    string message?;
    error cause?;
    string detailMsg;
    boolean isFatal;
|};
function getRecordConstrainedError() returns error<string, Foo> {
    error<string, Foo> e = error("Some Error", detailMsg = "Failed Message", isFatal = true);
    return e;
}
