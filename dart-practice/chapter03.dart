typedef ListOfInt = List<int>;

String func1(String input) => "Hello $input Function";

void testPrint() {
  print("Test Print");
}

void printInputsDefault(
    {String input1 = "input1",
    String input2 = "input2",
    String input3 = "input3"}) {
  print("input1 = $input1, input2 = $input2, input3 = $input3");
}

void printInputRequired(
    {required String input1, required String input2, required String input3}) {
  print("input1 = $input1, input2 = $input2, input3 = $input3");
}

String printInputOptional(String name, [String? job = "Baeksu"]) =>
    "Hello My name is $name, My job is $job";

String getUppercaseName(String? name) {
  return name?.toUpperCase() ?? "NULL";
}

ListOfInt reverseList(ListOfInt list) {
  return list.reversed.toList();
}

void main() {
  var dart = "Dart";
  testPrint();
  print(func1(dart));

  printInputsDefault(
    input1: "test",
  );

  printInputRequired(input1: "test", input2: "ppp", input3: "ddd");

  var outputStr = printInputOptional("kyeongho");
  print(outputStr);

  var name;
  name ??= "Null Name";
  var upperName = getUppercaseName(name);

  print(upperName);

  print(reverseList([1, 2, 3]));
}
