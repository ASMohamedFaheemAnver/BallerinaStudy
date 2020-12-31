import ballerina/io;
const ACCOUNT_NOT_FOUND = "AccountNotFound";
const INVALID_ACCOUND_ID = "InvalidAccoundId";

function getAccountBalance(int accoundId) returns int|error {
    if (accoundId < 0) {
        return error(INVALID_ACCOUND_ID, accoundId = accoundId);
    } else if (accoundId > 100) {
        return error(ACCOUNT_NOT_FOUND, accoundId = accoundId);
    }

    return 600;
}

public function main() {
    error simpleError = error("SimpleErrorType", message = "Simple error occured.");
    io:println("Error : ", simpleError.reason(), ", Message : ", simpleError.detail()?.message);

    int|error result = getAccountBalance(-1);

    if (result is int) {
        io:println("Account Balance: ", result);

    } else {
        io:println("Error: ", result.reason(),
            ", Account ID: ", result.detail()["accountID"]);
    }
}
