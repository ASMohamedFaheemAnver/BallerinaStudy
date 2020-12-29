import ballerina/io;

public function main() {
    io:println("foreach for 25 ... 28");
    foreach int i in 25 ... 28 {
        io:println(i);
    }

    io:println("\nforeach for 25 ..< 28");
    foreach int i in 25 ..< 28 {
        io:println(i);
    }


    abstract object {
        public function __iterator() returns abstract object {
            public function next() returns record {|int value;|}?;
        };
    } iterableObj = 25 ..< 28;

    abstract object {
        public function next() returns record {|int value;|}?;
    } iterator = iterableObj.__iterator();

    io:println("\niterable object for 25 ..<28");

    while (true) {
        record {|int value;|}? r = iterator.next();
        if (r is record {|int value;|}) {
            io:println(r.value);
        } else {
            break;
        }
    }
}
