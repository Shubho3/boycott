/// id : 1
/// category_name : "All"
/// date_time : "2023-05-25 18:48:20"

class CategoryListRes {
  CategoryListRes({
    num? id,
    String? categoryName,
    String? dateTime,
  }) {
    _id = id;
    _categoryName = categoryName;
    _dateTime = dateTime;
  }

  CategoryListRes.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _dateTime = json['date_time'];
  }

  num? _id;
  String? _categoryName;
  String? _dateTime;

  CategoryListRes copyWith({
    num? id,
    String? categoryName,
    String? dateTime,
  }) =>
      CategoryListRes(
        id: id ?? _id,
        categoryName: categoryName ?? _categoryName,
        dateTime: dateTime ?? _dateTime,
      );

  num? get id => _id;

  String? get categoryName => _categoryName;

  String? get dateTime => _dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    map['date_time'] = _dateTime;
    return map;
  }
}
