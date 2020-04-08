class User {
  int _id;
  String _userName;
  String _password;
  String _city;
  int _age;

  User(this._userName, this._password, this._city, this._age);

// To arrived each element with a value
  User.map(dynamic obj) {
    this._id = obj['id'];
    this._userName = obj['username'];
    this._password = obj['password'];
    this._city = obj['city'];
    this._age = obj['age'];
  }

  String get city => _city;

  String get password => _password;

  String get userName => _userName;

  int get age => _age;

  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['username'] = userName;
    map['password'] = password;
    map['city'] = city;
    map['age'] = age;
    /*
    - If the Admin just wants to update the data, no id is required
    - If he wants to register a new user, he needs the ID
    */
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

//  To extract the values
  User.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._userName = map['username'];
    this._password = map['password'];
    this._city = map['city'];
    this._age = map['age'];
  }
}
