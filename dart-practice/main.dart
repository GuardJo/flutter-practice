void chapter01() {
  print("Hello Dart");

  // var 키워드 연습
  var name = "guardjo";
  String name2 = "tester2";

  // dynamic 키워드 연습
  dynamic dynamicValue;

  if (dynamicValue is String) {
    // dynamic 타입이 String 타입으로 지정된 경우, String 함수 사용가능
    dynamicValue.isEmpty;
  }

  if (dynamicValue is int) {
    // dynamic 타입이 int 타입으로 지정된 경우, int 함수 사용가능
    dynamicValue.isEven;
  }

  String? nullableValue = null;

  // 기본적인 조건문을 통한 null 처리
  if (nullableValue != null) {
    nullableValue.isNotEmpty;
  }

  // ? 키워드를 통한 null 처리
  nullableValue?.isNotEmpty;

  // final 키워드를 통한 상수 할당
  final String finalValue = "final";

  print(finalValue);

  // late 키워드를 통한 지연 할당

  late final String lateValue;

  lateValue = "lateValue";

  print(lateValue);

  // const 키워드를 통한 컴파일 시점 값 할당
  const API_KEY = "test-key";

  print(API_KEY);

  // const RUNNING = DateTime.now();
}

void main() {
  // 기본 타입
  String str = "문자열";
  bool boolean = false;
  int integer = 1;
  double d = 1.1;

  num number = 1;
  number = 1.1;

  number.abs();

  // List 타입
  var lists = [1, 2, 3, 4];
  // List<int> lists = [1, 2, 3, 4];
  var giveMeFive = true;
  // collection if
  var lists2 = [1, 2, 3, 4, if (giveMeFive) 5];
  print(lists2);

  var name = "Tester";
  var age = 28;

  // String interpolation
  var profile = "Name : $name, Age : $age, KoreanAge : ${age + 1}";
  print(profile);

  // Collection for
  var oldData = ["file1", "file2"];
  var newData = [
    "file3",
    "file4",
    for (var fileName in oldData) "old_${fileName}"
  ];

  print(newData);

  // Map 타입
  var map1 = {"name": "tester", "age": 28};
  Map<String, String> map2 = {"key1": "value1", "key2": "Value2"};
  Map<List<int>, String> map3 = {
    [1, 2, 3]: "One Twon Three",
    [4, 5]: "Four, Five"
  };
  print(map2["key1"]);

  // Set 타입
  var set1 = {1, 2, 3, 4};
  // Set<int> set1 = {1, 2, 3, 4};

  set1.add(1);
  print(set1);
}
