class Player {
  String name;
  int age;
  PlayerType? type = PlayerType.basic;

  Player({required this.name, required this.age, this.type = PlayerType.basic});

  Player.TestPlayer()
      : this.name = "Tester",
        this.age = 100;

  Player.fromJson(Map<String, dynamic> json)
      : this.name = json["name"],
        this.age = json["age"];

  void printInfo() {
    print("Player {name : $name, age : $age, type : $type}");
  }
}

enum PlayerType { basic, pro }

abstract class Fruits {
  void printInfo();
}

class Apple extends Fruits {
  @override
  void printInfo() {
    // TODO: implement printInfo
    print("This is Apple");
  }
}

class Phone {
  final String phoneNumber;

  Phone(this.phoneNumber);

  void printNumber() {
    print("My Phone Number is $phoneNumber");
  }
}

class Iphone extends Phone {
  final String appleId;

  Iphone({required this.appleId, required String phoneNumber})
      : super(phoneNumber);

  @override
  void printNumber() {
    super.printNumber();
    print("My appleId is $appleId");
  }
}

mixin Programmer {
  final String programLanguage = "dart";

  void printProgrammerInfo() {
    print("I'm Programmer, Studying $programLanguage");
  }
}

mixin Student {
  final String schoolName = "Dart Highschool";

  void printStudent() {
    print("I'm Student, in $schoolName");
  }
}

class Human with Programmer, Student {
  String name;

  Human(this.name);
}

void main() {
  var player = Player(name: "Tester", age: 20);

  print(player.name);

  player.printInfo();

  var tester = Player.TestPlayer();
  tester.printInfo();

  var inputData = [
    {"name": "person1", "age": 10},
    {"name": "person2", "age": 23},
    {"name": "person3", "age": 29}
  ];

  inputData.forEach((element) {
    var player = Player.fromJson(element);
    player.printInfo();
  });

  var updatePlayer = Player(name: "old", age: 13)
    ..name = "new"
    ..age = 14;

  updatePlayer.printInfo();

  var newPlayer = updatePlayer
    ..name = "newnew"
    ..age = 100;

  newPlayer.printInfo();

  var apple = Apple();
  apple.printInfo();

  var myPhone = Iphone(appleId: "testid", phoneNumber: "000-0000-0000");

  myPhone.printNumber();

  var human = Human("Human1");
  human.printProgrammerInfo();
  human.printStudent();
}
