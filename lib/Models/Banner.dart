class Banner {
  Banner({
    String? name,
    String? image,
  }) {
    _name = name;
    _image = image;
  }

  Banner.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
  }
  String? _name;
  String? _image;
  Banner copyWith({
    String? name,
    String? image,
  }) =>
      Banner(
        name: name ?? _name,
        image: image ?? _image,
      );
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }
}
