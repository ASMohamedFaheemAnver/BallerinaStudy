import ballerina/io;

public function main() {
    io:println("Worker execution started");

    worker w1 {

        int n = 10000000;
        int sum = 0;
        foreach var i in 1 ... n {
            sum += i;
        }
        io:println("sum of first ", n, " positive numbers = ", sum);
    }


    @strand {
        thread: "any"
    }
    worker w2 {

        int n = 10000000;
        int sum = 0;
        foreach var i in 1 ... n {
            sum += i * i;
        }
        io:println("sum of squares of first ", n,
            " positive numbers = ", sum);
    }

    _ = wait {w1, w2};

    io:println("Worker execution finished");
}
