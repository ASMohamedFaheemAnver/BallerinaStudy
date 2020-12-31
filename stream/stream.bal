import ballerina/io;
type OddNumberGenerator object {
    int i = 1;

    public function next() returns record {|int value;|}|error? {
        self.i += 2;
        return {value: self.i};
    }
};

type ResultValue record {|
    int value;
|};
type Student record {
    string firstName;
    string lastName;
    float score;
};
type StudentValue record {|
    Student value;
|};
type FullName record {|
    string firstName;
    string lastName;
|};
type Subscription record {|
    string firstName;
    string lastName;
    float score;
    string degree;
|};
public function main() {
    OddNumberGenerator oddGen = new;
    var oddNumberStream = new stream <int, error>(oddGen);

    record {|int value;|}|error? oddNumber = oddNumberStream.next();
    if (oddNumber is ResultValue) {
        io:println("Retrieved odd number: ", oddNumber.value);
    }
    io:println("Filter records and map them to a different type :");
    Student s1 = {firstName: "Alex", lastName: "George", score: 1.5};
    Student s2 = {firstName: "Ranjan", lastName: "Fonseka", score: 0.9};
    Student s3 = {firstName: "John", lastName: "David", score: 1.2};
    Student[] studentList = [s1, s2, s3];
    stream<Student> studentStream = studentList.toStream();

    stream<Subscription> subscriptionStream = studentStream.filter(function (Student student) returns boolean {
        return student.score > 1;
    }).'map(function (Student student) returns Subscription {
        Subscription subscription = {
            firstName: student.firstName,
            lastName: student.lastName,
            score: student.score,
            degree: "Bachelor of Medicine"
        };
        return subscription;
    });

    io:println("Calculate the average score of the subscribed students: ");
    float? avg = subscriptionStream.reduce(function (float accum, Student student) returns float {
        return accum + <float>student.score / studentList.length();
    }, 0.0);

    if (avg is float) {
        io:println("Average: ", avg);
    }
    stream<Student> studentStream2 = studentList.toStream();

    io:println("Calls next method manually and get the next iteration value: ");
    record {|Student value;|}|error? student = studentStream2.next();
    if (student is StudentValue) {
        io:println(student.value);
    }

    io:println("Use foreach method to loop through the rest of the stream: ");
    error? e = studentStream2.forEach(function (Student student) {
        io:println("Student ", student.firstName, " has a score of ", student.score);
    });

    if (e is error) {
        io:println("ForEach operation on the stream failed: ", e);
    }

    stream<Student> studentStream3 = studentList.toStream();
    var iterator = studentStream3.iterator();
    record {|Student value;|}|error? nextStudent = iterator.next();
    if (nextStudent is StudentValue) {
        io:println(nextStudent.value);
    }
}
