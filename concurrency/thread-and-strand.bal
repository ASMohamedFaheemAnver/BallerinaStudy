import ballerina/io;

public function case1() {

    io:println("--- case 1 ---");
    future<int> f1 = start multiply(1, 2);

    io:println("Before the wait action");
    int result = wait f1;
    io:println("After the wait action\n");
}

public function case2() {

    io:println("--- case 2 ---");
    future<int> f1 = @strand {thread: "any"} start multiply(1, 2);

    io:println("Before the wait action");
    int result = wait f1;
    io:println("After the wait action\n");
}
public function case3() {
    io:println("--- case 3 ---");
    future<int> f1 = @strand {thread: "any"} start multiply(1, 2);
    future<int> f2 = @strand {thread: "any"} start multiply(4, 5);

    io:println("Before the wait action");
    map<int> results = wait {f1, f2};
    io:println("After the wait action\n");
}
public function case4() {
    io:println("--- case 4 ---");
    future<int> f1 = @strand {thread: "any"} start multiply(1, 2);
    future<int> f2 = start multiply(4, 5);

    io:println("Before the wait action");
    map<int> results = wait {f1, f2};
    io:println("After the wait action\n");
}
public function case5() {
    io:println("--- case 5 ---");
    future<int> f1 = start multiply(1, 2);
    future<int> f2 = start multiply(4, 5);

    io:println("Before the wait action");
    map<int> results = wait {f1, f2};
    io:println("After the wait action\n");
}
public function main() {
    case1();
    case2();
    case3();
    case4();
    case5();
}
function multiply(int x, int y) returns int {
    io:println(string `Multiplying ${x} * ${y}`);
    return x * y;
}
