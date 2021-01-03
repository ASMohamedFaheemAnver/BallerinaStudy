import ballerina/io;

const INVALID_ACC_TYPE = "InvalidAccountType";

type InvalidAccountTypeErrorData record {
    string message?;
    error cause?;
    string accountType;
};

type InvalidAccountTypeError error<INVALID_ACC_TYPE, InvalidAccountTypeErrorData>;

function getTypeId(string accountType) returns int|InvalidAccountTypeError {
    match accountType {
        "checking" => {
            return 1;
        }
        "savings" => {
            return 2;
        }
    }
    InvalidAccountTypeError e = InvalidAccountTypeError( accountType = accountType);
    return e;
}

type AccountNotFoundErrorData record {
    string message?;
    error cause?;
    int accountID;
};
const INVALID_ACCOUNT_ID = "InvalidAccountID";
const ACCOUNT_NOT_FOUND = "AccountNotFound";
type AccountNotFoundError error<ACCOUNT_NOT_FOUND|INVALID_ACCOUNT_ID, AccountNotFoundErrorData>;

function getAccountBalance(int accountID) returns int|AccountNotFoundError {
    if (accountID < 0) {
        AccountNotFoundError accountNotFoundError =
            error(INVALID_ACCOUNT_ID, accountID = accountID);
        return accountNotFoundError;
    } else if (accountID > 100) {

        AccountNotFoundError accountNotFoundError =
            error(ACCOUNT_NOT_FOUND, accountID = accountID);
        return accountNotFoundError;
    }

    return 600;
}

type InquiryFailedErrorData record {|
    string message;
    error cause;
    int accountID;
|};

type AccountInquiryFailed error<string, InquiryFailedErrorData>;
function transferToAccount(int fromAccountId, int toAccountId, int amount) returns int|AccountInquiryFailed {
    var balance = getAccountBalance(fromAccountId);
    if (balance is error) {
        AccountInquiryFailed e = error("AccountInquiryFailed", message = balance.reason(), cause = balance, accountID = fromAccountId);
        return e;
    } else {

    }

    return 0;
}


public function main() {
    int|InvalidAccountTypeError result = getTypeId("Joined");
    if (result is int) {
        io:println("Account type ID: ", result);
    } else {
        io:println("Error: ", result.reason(),
            ", Account type: ", result.detail().accountType);
    }
    var result2 = getAccountBalance(-1);
    if (result2 is int) {
        io:println("Account Balance: ", result2);

    } else {
        io:println("Error: ", result2.reason(),
            ", Account ID: ", result2.detail().accountID);
    }

    var result3 = transferToAccount(-1, 90, 1000);
    if (result3 is int) {
        io:println("Transfer success: ", result3);
    } else {
        io:println("Error: ", result3.reason(),
            ", Message: ", result3.detail().message,
            ", Cause: ", result3.detail().cause);
    }
}
