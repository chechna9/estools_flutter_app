class User {
  late String _userId;
  late String _firstname;
  late String _lastname;
  late String _email;
  late String _configuration;

  constructorUser(
      {required String userId,
      required String firstname,
      required String lastname,
      required String configuration,
      required String email}) {
    this._userId = userId;
    this._firstname = firstname;
    this._lastname = lastname;
    this._configuration = configuration;
    this._email = email;

    this._userId;
    this._firstname;
    this._lastname;
    this._email;
    this._configuration;
  }

  // Properties
  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get firstname => _firstname;
  set firstname(String firstname) => _firstname = firstname;
  String get lastname => _lastname;
  set lastname(String lastname) => _lastname = lastname;
  String get configuration => _configuration;
  set configuration(String configuration) => _configuration = configuration;
  String get email => _email;
  set email(String email) => _email = email;

  // create the user object from json input
  User.fromJson(Map<String, dynamic> json) {
    _userId = json['_id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _configuration = json['configuration'];
  }

  // exports to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._userId;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['configuration'] = this._configuration;
    data['email'] = this._email;
    return data;
  }
}
