import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';
import 'package:sqlite/models/user.dart';
import 'package:sqlite/utils/database_helper.dart';

List myUsers;

void main() async {
  /*TO SOLVE PROBLEM: Unhandled Exception: ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized*/
  WidgetsFlutterBinding.ensureInitialized();

  var db = new DatabaseHelper();

  User a1 = User.fromMap({
    "id": 1,
    "userName": 'A1',
    "password": '999',
    "city": 'safad',
    "age": 25
  });
//  await db.update(a1);
  await db.deleteUser(3);
  myUsers = await db.getAllUsers();
  for (int i = 0; i < myUsers.length; i++) {
    User user = User.map(myUsers[i]);
    print(
      sprintf("ID: %s - Username: %s - Password: %s - City: %-10s - Age: %s",
          [user.id, user.userName, user.password, user.city, user.age]),
    );
  }

  runApp(MaterialApp(
    title: 'SQLite',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
