import ballerina/io;

function printSalaryDetails(int baseSalary, int annualIncrement = 20, float bonusRate = 0.02) {
    io:println("Base salary : ", baseSalary, " | Annual increment : ", annualIncrement, " | Bonus rate : ", bonusRate);
}

public function main() {
    printSalaryDetails(2500, annualIncrement = 100);
    printSalaryDetails(2500, 100);
    printSalaryDetails(2500, 20, 0.1);
    printSalaryDetails(2500, annualIncrement = 100, bonusRate = 0.1);
    printSalaryDetails(annualIncrement = 100, baseSalary = 2500, bonusRate = 0.1);
}
