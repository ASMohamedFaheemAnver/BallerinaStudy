import ballerina/io;
public function main() {
    int value = 1;
    io:println("value: ", value);
    value += 7;
    io:println("value += 7: ", value);

    value -= 2;
    io:println("value -= 2: ", value);

    value /= 3;
    io:println("value /= 3: ", value);

    value *= 2;
    io:println("value *= 2: ", value);

    value &= 4;
    io:println("value &= 4: ", value);

    value |= 3;
    io:println("value |= 3: ", value);

    value ^= 5;
    io:println("value ^= 5: ", value);

    value <<= 1;
    io:println("value <<= 1: ", value);

    value >>= 1;
    io:println("value >>= 1: ", value);

    value >>>= 1;
    io:println("value >>>= 1: ", value);
}
