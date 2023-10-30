class EventListModel {
  EventListModel({
    required this.status,
    required this.data,
    required this.message,
  });
  late final String status;
  late final List<Events> data;
  late final String message;

  EventListModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>Events.fromJson(e)).toList();
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

class Events {
  Events({
    required this.id,
    required this.userId,
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.categoryId,
    required this.repeatDay,
    required this.dateTime,
    required this.isFav,
    required this.eventType,
  });
  late final int id;
  late final int userId;
  late final String eventName;
  late final String eventDate;
  late final String eventTime;
  late final int categoryId;
  late final String repeatDay;
  late final String dateTime;
  late final String eventType;
  late final bool isFav;

  Events.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    eventName = json['event_name'];
    eventDate = json['event_date'];
    eventTime = json['event_time'];
    categoryId = json['category_id'];
    repeatDay = json['repeat_day'];
    dateTime = json['date_time'];
    eventType = json['event_type'];
    isFav = json['isFav']=='0'?false:true;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['event_name'] = eventName;
    _data['event_date'] = eventDate;
    _data['event_time'] = eventTime;
    _data['category_id'] = categoryId;
    _data['repeat_day'] = repeatDay;
    _data['date_time'] = dateTime;
    _data['isFav'] = dateTime;
    _data['event_type'] = dateTime;
    return _data;
  }
}