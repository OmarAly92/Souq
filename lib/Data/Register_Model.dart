/// status : 201
/// message : "User created"
/// data : {"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjYzMmIxODY3YTdjOTllMTFmZTY0YTIxZSIsIm5hbWUiOiJBbGV4IFBpIiwicm9sZSI6IlJPTEVfQ1VTVE9NRVIiLCJlbWFpbCI6ImV4YW1wbGVAbWFpbC5jb20ifSwiaWF0IjoxNjYzNzY4Njc5LCJleHAiOjE2NjM3Njk1Nzl9.oZPxMTEtI6gyVW67lH2pRm2Vqcj76k4TqxIKQJpYYew","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjYzMmIxODY3YTdjOTllMTFmZTY0YTIxZSIsIm5hbWUiOiJBbGV4IFBpIiwicm9sZSI6IlJPTEVfQ1VTVE9NRVIiLCJlbWFpbCI6ImV4YW1wbGVAbWFpbC5jb20ifSwiaWF0IjoxNjYzNzY4Njc5LCJleHAiOjE2NjQzNzM0Nzl9.gXwnbcaAf_odXN8vNSBPxvzAXXEqZau5OjbzLumy5R4"}

class RegisterModel {
  RegisterModel({
      num? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  RegisterModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  Data? _data;
RegisterModel copyWith({  num? status,
  String? message,
  Data? data,
}) => RegisterModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjYzMmIxODY3YTdjOTllMTFmZTY0YTIxZSIsIm5hbWUiOiJBbGV4IFBpIiwicm9sZSI6IlJPTEVfQ1VTVE9NRVIiLCJlbWFpbCI6ImV4YW1wbGVAbWFpbC5jb20ifSwiaWF0IjoxNjYzNzY4Njc5LCJleHAiOjE2NjM3Njk1Nzl9.oZPxMTEtI6gyVW67lH2pRm2Vqcj76k4TqxIKQJpYYew"
/// refresh_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjYzMmIxODY3YTdjOTllMTFmZTY0YTIxZSIsIm5hbWUiOiJBbGV4IFBpIiwicm9sZSI6IlJPTEVfQ1VTVE9NRVIiLCJlbWFpbCI6ImV4YW1wbGVAbWFpbC5jb20ifSwiaWF0IjoxNjYzNzY4Njc5LCJleHAiOjE2NjQzNzM0Nzl9.gXwnbcaAf_odXN8vNSBPxvzAXXEqZau5OjbzLumy5R4"

class Data {
  Data({
      String? accessToken, 
      String? refreshToken,}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Data.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
  }
  String? _accessToken;
  String? _refreshToken;
Data copyWith({  String? accessToken,
  String? refreshToken,
}) => Data(  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    return map;
  }

}