class UserCredentials {
  UserCredentials({this.username, this.email, this.password});

  String username;
  String email;
  String password;

  void setUsername(String value) {
    username = value;
  }

  void setPassword(String value) {
    password = value;
  }

  void setEmail(String value) {
    email = value;
  }

  String get getUsername => username;
  String get getEmail => email;
  String get getPassword => password;
}