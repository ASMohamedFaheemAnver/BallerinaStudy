import ballerina/io;
public function main() {
    [boolean, float] t = [true, 0.4];
    io:println("Simple variable : ", t);

    [boolean, float] [a1, a2] = [true, 0.4];
    io:println("Tuple variable : ", a1, " ", a2);

    [[string, int], float] [[b1, b2], b3] = [["Ballerina", 4], 6.7];
    io:println("Tuple variable : ", b1, " ", b2, " ", b3);

    [[string, int], [boolean, float]] [[c1, c2], [c3, c4]] =
        [["Ballerina", 34], [true, 6.7]];
    io:println("Tuple variable : ", c1, " ", c2, " ", c3, " ", c4);
    [[string, [int, [boolean, byte]]], [float, int]] v1 =
        [["Ballerina", [3, [true, 34]]], [5.6, 45]];
    [[string, [int, [boolean, byte]]],
        [float, int]] [[d1, [d2, [d3, d4]]], [d5, d6]] = v1;
    io:println("Tuple variable : ",
        d1, " ", d2, " ", d3, " ", d4, " ", d5, " ", d6);

    [string|int|float, [string|float, int]] [g1, [g2, g3]] =
        ["Ballerina", [3.4, 456]];
    io:println("Tuple variable : ", g1, " ", g2, " ", g3);
}
