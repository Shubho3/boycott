import 'Banner.dart';

/// status : "true"
/// data : [{"name":"banner 1","image":"https://technorizen.com/Timetrekz/public/images/MaskGroup.png"},{"name":"banner 2","image":"https://technorizen.com/Timetrekz/public/images/MaskGroup.png"},{"name":"banner 3","image":"https://technorizen.com/Timetrekz/public/images/MaskGroup.png"},{"name":"banner 4","image":"https://technorizen.com/Timetrekz/public/images/MaskGroup.png"}]
/// message : "successfully"

class BannerRes {
  BannerRes({
    String? status,
    List<Banner>? data,
    String? message,
  }) {
    _status = status;
    _data = data;
    _message = message;
  }

  BannerRes.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Banner.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _status;
  List<Banner>? _data;
  String? _message;
  BannerRes copyWith({
    String? status,
    List<Banner>? data,
    String? message,
  }) =>
      BannerRes(
        status: status ?? _status,
        data: data ?? _data,
        message: message ?? _message,
      );
  String? get status => _status;
  List<Banner>? get data => _data;
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

/// name : "banner 1"
/// image : "https://technorizen.com/Timetrekz/public/images/MaskGroup.png"
