/// status : "true"
/// banner : [{"id":1,"name":"tyryr","image":"rgsdg","date_time":"2023-05-25 15:31:11"},{"id":2,"name":"tyryr","image":"ddgdgb","date_time":"2023-05-25 15:31:11"}]
/// message : "successfully"

class BannerList {
  BannerList({
    String? status,
    List<Banner>? banner,
    String? message,
  }) {
    _status = status;
    _banner = banner;
    _message = message;
  }

  BannerList.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _banner = [];
      json['data'].forEach((v) {
        _banner?.add(Banner.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _status;
  List<Banner>? _banner;
  String? _message;
  BannerList copyWith({
    String? status,
    List<Banner>? banner,
    String? message,
  }) =>
      BannerList(
        status: status ?? _status,
        banner: banner ?? _banner,
        message: message ?? _message,
      );
  String? get status => _status;
  List<Banner>? get banner => _banner;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_banner != null) {
      map['banner'] = _banner?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }
}

/// id : 1
/// name : "tyryr"
/// image : "rgsdg"
/// date_time : "2023-05-25 15:31:11"

class Banner {
  Banner({
    num? id,
    String? name,
    String? image,
    String? dateTime,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _dateTime = dateTime;
  }

  Banner.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _dateTime = json['date_time'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _dateTime;
  Banner copyWith({
    num? id,
    String? name,
    String? image,
    String? dateTime,
  }) =>
      Banner(
        id: id ?? _id,
        name: name ?? _name,
        image: image ?? _image,
        dateTime: dateTime ?? _dateTime,
      );
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get dateTime => _dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['date_time'] = _dateTime;
    return map;
  }
}
