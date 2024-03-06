class User {
String _name = "Unknown";
int _age = 100;

User(this._name, this._age);

User.fromBirthYear(int birthYear) {
  _age = DateTime.now().year - birthYear;
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

}