/// status : 200
/// data : {"_id":"61ab431c0f34753bcedfa7a6","title":"running sneaker","price":200,"category":{"_id":"61ab1d0e4a0fef3f27dc664d","name":"bags & shoes","slug":"bags-and-shoes"},"description":null,"createdBy":{"role":"ROLE_CUSTOMER","_id":"612e4851345dcc333ac6cb24","name":"Robert Gonzalez"},"createdAt":"2021-12-04T10:29:48.295Z","updatedAt":"2021-12-04T10:29:48.295Z","slug":"running-sneaker"}
/// message : "Success! Product found"

// ignore_for_file: file_names

class DetailsModel {
  DetailsModel({
      num? status, 
      Data? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  DetailsModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  num? _status;
  Data? _data;
  String? _message;
DetailsModel copyWith({  num? status,
  Data? data,
  String? message,
}) => DetailsModel(  status: status ?? _status,
  data: data ?? _data,
  message: message ?? _message,
);
  num? get status => _status;
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

/// _id : "61ab431c0f34753bcedfa7a6"
/// title : "running sneaker"
/// price : 200
/// category : {"_id":"61ab1d0e4a0fef3f27dc664d","name":"bags & shoes","slug":"bags-and-shoes"}
/// description : null
/// createdBy : {"role":"ROLE_CUSTOMER","_id":"612e4851345dcc333ac6cb24","name":"Robert Gonzalez"}
/// createdAt : "2021-12-04T10:29:48.295Z"
/// updatedAt : "2021-12-04T10:29:48.295Z"
/// slug : "running-sneaker"

class Data {
  Data({
      String? id, 
      String? title, 
      num? price, 
      Category? category, 
      dynamic description, 
      CreatedBy? createdBy, 
      String? createdAt, 
      String? updatedAt, 
      String? slug,}){
    _id = id;
    _title = title;
    _price = price;
    _category = category;
    _description = description;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _slug = slug;
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
  }
  String? _id;
  String? _title;
  num? _price;
  Category? _category;
  dynamic _description;
  CreatedBy? _createdBy;
  String? _createdAt;
  String? _updatedAt;
  String? _slug;
Data copyWith({  String? id,
  String? title,
  num? price,
  Category? category,
  dynamic description,
  CreatedBy? createdBy,
  String? createdAt,
  String? updatedAt,
  String? slug,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  price: price ?? _price,
  category: category ?? _category,
  description: description ?? _description,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  slug: slug ?? _slug,
);
  String? get id => _id;
  String? get title => _title;
  num? get price => _price;
  Category? get category => _category;
  dynamic get description => _description;
  CreatedBy? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get slug => _slug;

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
    return map;
  }

}

/// role : "ROLE_CUSTOMER"
/// _id : "612e4851345dcc333ac6cb24"
/// name : "Robert Gonzalez"

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

/// _id : "61ab1d0e4a0fef3f27dc664d"
/// name : "bags & shoes"
/// slug : "bags-and-shoes"

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