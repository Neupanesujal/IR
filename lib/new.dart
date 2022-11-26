import 'dart:convert';

import 'package:http/http.dart';
import 'package:orbit/model/userModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class data{
 
}

class ApiServices{
  int health = 0  ;
  int damage = 0 ; 
  int id  = 0  ; 
  String endpoint='http://172.130.101.39:3000/api/v1/reqServer/';
  Future<List<userModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    print("${response.body} hya aayo ");
    if(response.statusCode == 200){
       final List result= json.decode(response.body)['data'];
       return result.map(((e) => userModel.fromJson(e))).toList();
    }
    else{
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiServices>((ref)=>ApiServices());

