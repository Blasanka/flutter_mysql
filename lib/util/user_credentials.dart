class UserCredentials {
  UserCredentials({this.email, this.password});

  String email;
  String password;

  void setPassword(String value) {
    password = value;
  }

  void setEmail(String value) {
    email = value;
  }

  String get getEmail => email;
  String get getPassword => password;
}