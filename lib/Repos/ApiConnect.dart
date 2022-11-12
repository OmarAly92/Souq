
import 'package:dio/dio.dart';
import 'package:souq/Data/Product_Model.dart';
import '../Data/Details_Model.dart'hide Data;
import '../Data/Register_Model.dart'hide Data;
import '../Utilities/Api.dart';
class GetRequest {
  Dio dio = Dio();


 Future<List<Data>> getProduct() async {
    Response response = await dio.get(productApi);
    ProductModel products = ProductModel.fromJson(response.data);
    return products.data!;
  }
  Future<DetailsModel> getDetailModel(String title) async {
    var response = await Dio().get('$detailsApi${title.replaceAll(" ", "-")}');
    return DetailsModel.fromJson(response.data);
  }

  Future<dynamic> loginReq(String email,String password) async {
    Response response = await dio.post(loginApi,data: {"email":email,"password": password});
    return response.data;
  }
  Future<dynamic>registerReq(String name,String email,dynamic number,String password, String passRepeat)async{
    Map data ={
      "name": name,
      "email": email,
      "number": number,
      "password": password,
      "password_repeat": passRepeat
    };
    Response response = await dio.post(registerApi,data: data );
    var register = RegisterModel.fromJson(response.data);
    return register.data;
  }

}
