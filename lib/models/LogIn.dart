class LogIn{
  int _id;
  String _email;
  String _password;

  LogIn();

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}