/// status : "true"
/// data : {"id":1,"image":"2.jpg","user_name":"pooja","phone":"9926335358","email":"jitu@gmail.com","password":"123456","otp":"9999","online_status":1,"date_time":"2023-05-25 13:15:36"}
/// message : "login successful"

class LoginResponse {
  LoginResponse({
    String? status,
    Data? data,
    String? message,
  }) {
    _status = status;
    _data = data;
    _message = message;
  }

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  String? _status;
  Data? _data;
  String? _message;
  LoginResponse copyWith({
    String? status,
    Data? data,
    String? message,
  }) =>
      LoginResponse(
        status: status ?? _status,
        data: data ?? _data,
        message: message ?? _message,
      );
  String? get status => _status;
  Data? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

/// id : 1
/// image : "2.jpg"
/// user_name : "pooja"
/// phone : "9926335358"
/// email : "jitu@gmail.com"
/// password : "123456"
/// otp : "9999"
/// online_status : 1
/// date_time : "2023-05-25 13:15:36"

class Data {
  Data({
    num? id,
    String? image,
    String? userName,
    String? phone,
    String? email,
    String? password,
    String? otp,
    num? onlineStatus,
    String? dateTime,
  }) {
    _id = id;
    _image = image;
    _userName = userName;
    _phone = phone;
    _email = email;
    _password = password;
    _otp = otp;
    _onlineStatus = onlineStatus;
    _dateTime = dateTime;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _userName = json['user_name'];
    _phone = json['phone'];
    _email = json['email'];
    _password = json['password'];
    _otp = json['otp'];
    _onlineStatus = json['online_status'];
    _dateTime = json['date_time'];
  }
  num? _id;
  String? _image;
  String? _userName;
  String? _phone;
  String? _email;
  String? _password;
  String? _otp;
  num? _onlineStatus;
  String? _dateTime;
  Data copyWith({
    num? id,
    String? image,
    String? userName,
    String? phone,
    String? email,
    String? password,
    String? otp,
    num? onlineStatus,
    String? dateTime,
  }) =>
      Data(
        id: id ?? _id,
        image: image ?? _image,
        userName: userName ?? _userName,
        phone: phone ?? _phone,
        email: email ?? _email,
        password: password ?? _password,
        otp: otp ?? _otp,
        onlineStatus: onlineStatus ?? _onlineStatus,
        dateTime: dateTime ?? _dateTime,
      );
  num? get id => _id;
  String? get image => _image;
  String? get userName => _userName;
  String? get phone => _phone;
  String? get email => _email;
  String? get password => _password;
  String? get otp => _otp;
  num? get onlineStatus => _onlineStatus;
  String? get dateTime => _dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['user_name'] = _userName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['password'] = _password;
    map['otp'] = _otp;
    map['online_status'] = _onlineStatus;
    map['date_time'] = _dateTime;
    return map;
  }
}
