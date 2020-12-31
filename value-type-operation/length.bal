import ballerina/io;
public function main() {
    int[] intArray = [1, 2, 3];
    int length;

    length = intArray.length();
    io:println("Integer array size: ", length);

    json[] jsonArray = [
            {"name": "John", "age": 31},
            {"name": "Neal", "age": 22}
        ];

    length = jsonArray.length();
    io:println("JSON array size: ", length);

    map<int> strMap = {};
    strMap["A"] = 1;
    strMap["B"] = 2;
    strMap["C"] = 3;

    length = strMap.length();
    io:println("Map size: ", length);

    string myStr = "My name is Peter Parker";


    length = myStr.length();
    io:println("String size: ", length);

    xml x1 = xml `<book>
                    <name>Sherlock Holmes</name>
                    <author>Sir Arthur Conan Doyle</author>
                    <!--Price: $10-->
                  </book>`;

    length = (x1/<*>).length();
    io:println("XML child elements size: ", length);

    [int, string] tupleVar = [10, "John"];

    length = tupleVar.length();
    io:println("Tuple size: ", length);

    Student stu = {id: 1, fname: "John", lname: "Doe", age: 17};

    length = stu.length();
    io:println("Field size in `Student` record: ", length);
}

type Student record {|
    int id;
    string fname;
    string lname;
    int age;
    string...;
|};