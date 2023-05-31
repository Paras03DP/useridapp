import '../../model/user.dart';

// api implementaiton
class RemoteDataSource {
  List<User> users = [
    User(id: 1, name: "paras", dob: "27/07/2001", birthTime: "10/30"),
    User(id: 2, name: "bibek", dob: "10/10/2005", birthTime: "12/12"),
    User(id: 3, name: "ramesh", dob: "01/10/2006", birthTime: "21/12"),
  ];

  bool addUser(User users) {
    this.users.add(users);
    return true;
  }

  List<User> getUser() {
    return users;
  }
}
