/// data : [{"products":["61ab420c0f34753bcedfa787","61ab42600f34753bcedfa78b","61ab42790f34753bcedfa78f"],"_id":"61ab1ca64a0fef3f27dc663f","name":"men's fashion","slug":"mens-fashion"}]
/// status : 200
/// message : "Success"

class CategoryModel {
  CategoryModel({
      List<Data>? data, 
      num? status, 
      String? message,}){
    _data = data;
    _status = status;
    _message = message;
}

  CategoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }
  List<Data>? _data;
  num? _status;
  String? _message;
CategoryModel copyWith({  List<Data>? data,
  num? status,
  String? message,
}) => CategoryModel(  data: data ?? _data,
  status: status ?? _status,
  message: message ?? _message,
);
  List<Data>? get data => _data;
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}

/// products : ["61ab420c0f34753bcedfa787","61ab42600f34753bcedfa78b","61ab42790f34753bcedfa78f"]
/// _id : "61ab1ca64a0fef3f27dc663f"
/// name : "men's fashion"
/// slug : "mens-fashion"

class Data {
  Data({
      List<String>? products, 
      String? id, 
      String? name, 
      String? slug,}){
    _products = products;
    _id = id;
    _name = name;
    _slug = slug;
}

  Data.fromJson(dynamic json) {
    _products = json['products'] != null ? json['products'].cast<String>() : [];
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
  }
  List<String>? _products;
  String? _id;
  String? _name;
  String? _slug;
Data copyWith({  List<String>? products,
  String? id,
  String? name,
  String? slug,
}) => Data(  products: products ?? _products,
  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
);
  List<String>? get products => _products;
  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['products'] = _products;
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    return map;
  }

}