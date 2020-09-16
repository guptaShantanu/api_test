import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkService{

  String baseUrl = 'https://bharatmobility.in/api/models';

  Future<List> getVehicleList()async{
    try{
      http.Response response = await http.get(baseUrl);
      if(response.statusCode==200){
        var responseBody = jsonDecode(response.body);
        print(responseBody);
        return responseBody;
      }else{
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }


  Future<Map<String,dynamic>> getVehicleData(String id)async{
    try{
      http.Response response = await http.get(baseUrl+'/$id');
      if(response.statusCode==200){
        var responseBody = jsonDecode(response.body);
        print(responseBody);
        return responseBody;
      }else{
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }
}