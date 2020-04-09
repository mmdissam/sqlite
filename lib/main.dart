import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';
import 'package:sqlite/models/user.dart';
import 'package:sqlite/utils/database_helper.dart';

List myUsers;

void main() async {
  /*TO SOLVE PROBLEM: Unhandled Exception: ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized*/
  WidgetsFlutterBinding.ensureInitialized();

  var db = new DatabaseHelper();

//  await db.addUser(User('A3', '125', 'Rafah', 50));

 /* User a1 = User.fromMap({
    "id": 5,
    "userName": 'A3',
    "password": '125',
    "city": 'Rafah',
    "age": 50
  });*/

//  await db.update(a1);

  myUsers = await db.getAllUsers();
  for (int i = 0; i < myUsers.length; i++) {
    User user = User.map(myUsers[i]);
    print(
      sprintf("ID: %d - Username: %s - Password: %s - City: %-7s - Age: %d",
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
      body: ListView.builder(
        itemCount: myUsers.length,
          itemBuilder: ( BuildContext context ,int position) {
          return Card(
            color: Colors.deepOrangeAccent,
            elevation: 4,
            child: ListTile(
              title: Text('${User.fromMap(myUsers[position]).userName}'),
              subtitle: Text('${User.fromMap(myUsers[position]).city}'),
              leading: Icon(Icons.person),
              onTap: () => debugPrint('${User.fromMap(myUsers[position]).age}'),
            ),
          );
          }),
    );
  }
}
