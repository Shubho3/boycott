/// status : "true"
/// data : [{"id":1,"user_id":17,"text":"new notification","date_time":"2023-09-09 17:47:08"}]
/// message : "successfully"

class NotificationModel {
  NotificationModel({
      String? status, 
      List<notificationData>? data,
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  NotificationModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(notificationData.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _status;
  List<notificationData>? _data;
  String? _message;
NotificationModel copyWith({  String? status,
  List<notificationData>? data,
  String? message,
}) => NotificationModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  String? get status => _status;
  List<notificationData>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : 1
/// user_id : 17
/// text : "new notification"
/// date_time : "2023-09-09 17:47:08"

class notificationData {
  Data({
      num? id, 
      num? userId, 
      String? text, 
      String? dateTime,}){
    _id = id;
    _userId = userId;
    _text = text;
    _dateTime = dateTime;
}

  notificationData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _text = json['text'];
    _dateTime = json['date_time'];
  }
  num? _id;
  num? _userId;
  String? _text;
  String? _dateTime;
  notificationData copyWith({  num? id,
  num? userId,
  String? text,
  String? dateTime,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  text: text ?? _text,
  dateTime: dateTime ?? _dateTime,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get text => _text;
  String? get dateTime => _dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['text'] = _text;
    map['date_time'] = _dateTime;
    return map;
  }

}