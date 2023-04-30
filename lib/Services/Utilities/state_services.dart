import 'dart:convert';
import '../../models/WorldStateModel.dart';

import 'package:http/http.dart'as http;

import 'app_url.dart';

class StateService{

  Future <WorldStateModel>fetchData()async{
   http.Response response;
  response =await http.get(Uri.parse(ApiUrl.WorldStateUi));
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
   return WorldStateModel.fromJson(data);
  }
  else{
     throw Exception('error');
  }
  }

   Future <List<dynamic>>fetchCountryList()async{
   http.Response response;
   var data;
  response =await http.get(Uri.parse(ApiUrl.CountriesList));
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
   return data;
  }
  else{
     throw Exception('error');
  }
  }
}