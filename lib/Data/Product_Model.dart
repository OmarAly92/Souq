/// data : [{"_id":"61ab420c0f34753bcedfa787","title":"special cotton shirt for men","price":15,"category":{"_id":"61ab1ca64a0fef3f27dc663f","name":"men's fashion","slug":"mens-fashion"},"description":"","createdBy":{"role":"ROLE_CUSTOMER","_id":"612e49b9345dcc333ac6cb41","name":"Sofia Lily"},"createdAt":"2021-12-04T10:25:16.546Z","updatedAt":"2021-12-11T03:14:40.195Z","slug":"special-cotton-shirt-for-men","image":""}]
/// status : 200
/// message : "Success"

class ProductModel {
  ProductModel({
      List<Data>? data, 
      num? status, 
      String? message,}){
    _data = data;
    _status = status;
    _message = message;
}

  ProductModel.fromJson(dynamic json) {
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
ProductModel copyWith({  List<Data>? data,
  num? status,
  String? message,
}) => ProductModel(  data: data ?? _data,
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

/// _id : "61ab420c0f34753bcedfa787"
/// title : "special cotton shirt for men"
/// price : 15
/// category : {"_id":"61ab1ca64a0fef3f27dc663f","name":"men's fashion","slug":"mens-fashion"}
/// description : ""
/// createdBy : {"role":"ROLE_CUSTOMER","_id":"612e49b9345dcc333ac6cb41","name":"Sofia Lily"}
/// createdAt : "2021-12-04T10:25:16.546Z"
/// updatedAt : "2021-12-11T03:14:40.195Z"
/// slug : "special-cotton-shirt-for-men"
/// image : ""

class Data {
  Data({
      String? id, 
      String? title, 
      num? price, 
      Category? category, 
      String? description, 
      CreatedBy? createdBy, 
      String? createdAt, 
      String? updatedAt, 
      String? slug, 
      String? image,}){
    _id = id;
    _title = title;
    _price = price;
    _category = category;
    _description = description;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _slug = slug;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _price = json['price'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _description = json['description'];
    _createdBy = json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null;
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _slug = json['slug'];
    _image = json['image'];
  }
  String? _id;
  String? _title;
  num? _price;
  Category? _category;
  String? _description;
  CreatedBy? _createdBy;
  String? _createdAt;
  String? _updatedAt;
  String? _slug;
  String? _image;
Data copyWith({  String? id,
  String? title,
  num? price,
  Category? category,
  String? description,
  CreatedBy? createdBy,
  String? createdAt,
  String? updatedAt,
  String? slug,
  String? image,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  price: price ?? _price,
  category: category ?? _category,
  description: description ?? _description,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  slug: slug ?? _slug,
  image: image ?? _image,
);
  String? get id => _id;
  String? get title => _title;
  num? get price => _price;
  Category? get category => _category;
  String? get description => _description;
  CreatedBy? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get slug => _slug;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['description'] = _description;
    if (_createdBy != null) {
      map['createdBy'] = _createdBy?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['slug'] = _slug;
    map['image'] = _image;
    return map;
  }

}

/// role : "ROLE_CUSTOMER"
/// _id : "612e49b9345dcc333ac6cb41"
/// name : "Sofia Lily"

class CreatedBy {
  CreatedBy({
      String? role, 
      String? id, 
      String? name,}){
    _role = role;
    _id = id;
    _name = name;
}

  CreatedBy.fromJson(dynamic json) {
    _role = json['role'];
    _id = json['_id'];
    _name = json['name'];
  }
  String? _role;
  String? _id;
  String? _name;
CreatedBy copyWith({  String? role,
  String? id,
  String? name,
}) => CreatedBy(  role: role ?? _role,
  id: id ?? _id,
  name: name ?? _name,
);
  String? get role => _role;
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = _role;
    map['_id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// _id : "61ab1ca64a0fef3f27dc663f"
/// name : "men's fashion"
/// slug : "mens-fashion"

class Category {
  Category({
      String? id, 
      String? name, 
      String? slug,}){
    _id = id;
    _name = name;
    _slug = slug;
}

  Category.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
  }
  String? _id;
  String? _name;
  String? _slug;
Category copyWith({  String? id,
  String? name,
  String? slug,
}) => Category(  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
);
  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    return map;
  }

}