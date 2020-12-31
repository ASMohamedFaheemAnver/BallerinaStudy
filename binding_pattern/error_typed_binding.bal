import ballerina/io;
type SampleErrorData record {
    string message?;
    error cause?;
    string info;
    boolean fatal;
};
type SampleError error<string, SampleErrorData>;
public function main() {
    var error (reason, info = info, fatal = fatal) = getSampleError();
    io:println("Reason String: " + reason);
    io:println("Info: ", info);
    io:println("Fatal: ", fatal);

    var error (reasonTwo, ...params) = getSampleError();
    io:println("Reason String: ", reasonTwo);
    io:println("Detail Mapping: ", params);

    var error (reasonThree, info = info2, ...filteredParams) = getSampleError();
    io:println("Detail Mapping: ", filteredParams);


    var error (_, detailMsg = detailMsg, isFatal = isFatal) = getRecordConstrainedError();
    io:println("Detail Message: ", detailMsg);
}

function getSampleError() returns SampleError {
    SampleError e = error("Sample Error", info = "Detail Msg", fatal = true);
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
