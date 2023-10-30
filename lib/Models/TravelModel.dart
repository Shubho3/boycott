class TravelModel {
  TravelModel({
    required this.status,
    required this.data,
    required this.message,
  });
  late final String status;
  late final List<Data> data;
  late final String message;

  TravelModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.date,
    required this.time,
    required this.reminderType,
    required this.repeatTask,
    required this.note,
    required this.dateTime,
    required this.startLat,
    required this.startLon,
    required this.endLat,
    required this.endLon,
    required this.startAddress,
    required this.endAddress,
    required this.notifiStatus,
  });
  late  int id;
  late  int userId;
  late  String date;
  late  String time;
  late  String reminderType;
  late  String repeatTask;
  late  String note;
  late  String dateTime;
  late  String startLat;
  late  String startLon;
  late  String endLat;
  late  String endLon;
  late  String startAddress;
  late  String endAddress;
  late  String notifiStatus;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    time = json['time'];
    reminderType = json['reminder_type'];
    repeatTask = json['repeat_task'];
    note = json['note'];
    dateTime = json['date_time'];
    startLat = json['start_lat'];
    startLon = json['start_lon'];
    endLat = json['end_lat'];
    endLon = json['end_lon'];
    startAddress = json['start_address'];
    endAddress = json['end_address'];
    notifiStatus = json['notifi_status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['date'] = date;
    _data['time'] = time;
    _data['reminder_type'] = reminderType;
    _data['repeat_task'] = repeatTask;
    _data['note'] = note;
    _data['date_time'] = dateTime;
    _data['start_lat'] = startLat;
    _data['start_lon'] = startLon;
    _data['end_lat'] = endLat;
    _data['end_lon'] = endLon;
    _data['start_address'] = startAddress;
    _data['end_address'] = endAddress;
    _data['notifi_status'] = notifiStatus;
    return _data;
  }

}