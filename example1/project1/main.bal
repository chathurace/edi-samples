import project1.edi1;
import ballerina/io;

public function main() returns error? {
    string ediText = check io:fileReadString("resources/message.edi");
    edi1:SimpleOrder simpleOrder = check edi1:fromEdiString(ediText);
    io:println(simpleOrder.toJson());
}
