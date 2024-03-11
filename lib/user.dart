import 'dart:math';

mixin LoggerMixin {
  String log(String message) {
    return 'LOG: $message';
  }
}

class User with LoggerMixin {
  String _name = "Unknown";
  int _age = 100;

  User(this._name, this._age);

  User.fromBirthYear(int birthYear) {
    _age = DateTime.now().year - birthYear;
  }

  factory User.withAdultAge(String name) {
    return User(name, 18);
  }

  String get name => _name;

  set name(String newName) {
    _name = newName;
  }

  int get age => _age;

  set age(int newAge) {
    _age = newAge;
  }

  String sayHello() {
    return 'Hi, my name is $_name, and I am $_age years old.';
  }

  Function eatApple() {
    Map<String, int> appleVarieties = {
      'Red Delicious': 52,
      'Granny Smith': 47,
      'Honeycrisp': 80,
      'Fuji': 61,
      'Gala': 61,
    };
    void getApple() {
      randomKey(Map map) =>
          map.keys.elementAt(new Random().nextInt(map.length));
      var apple = randomKey(appleVarieties);
      print('I ate an $apple and its calorie count is: ' +
          appleVarieties[apple].toString() +
          '.');
    }

    return getApple;
  }
}
