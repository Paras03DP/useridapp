import '../../model/user.dart';

class LocalDataSource {
  List<User> users = [
    User(id: 1, name: "paras", dob: "27/07/2001", birthTime: "10:30"),
    User(id: 2, name: "ramesh", dob: "01/10/2006", birthTime: "12:12"),
  ];

  bool addUser(User users) {
    this.users.add(users);
    return true;
  }

  List<User> getUser() {
    return users;
  }
}
