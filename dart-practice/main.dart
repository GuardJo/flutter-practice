void main() {
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
