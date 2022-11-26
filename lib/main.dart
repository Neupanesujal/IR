
import 'dart:ffi';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit/data_provider.dart';
import 'package:orbit/model/userModel.dart';
import 'package:orbit/new.dart';
import 'dart:developer';

void main() {
   runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  var data = ApiServices() ; 
  newFunction(){
     print(data.health);
  }
  
  @override
  Widget build(BuildContext context, ref) {
   final _data = ref.watch(userDataProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('images/ntec.png',),
        ),
        body:


        _data.when(
          data: (_data){
            print(data.health);
            List<userModel> userList = _data.map((e) => e).toList();
            print(userList );
            return Column(
              children: [
                Expanded(child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_,index){
                    return Card(
                      color: Color(0x7ED957) ,     //7ed957
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: SingleChildScrollView(
                      
                        child: Column(
                          children: [
                            
                            Text(userList[index].health.toString()),
                             Container(
                             
                            //Text('sujal'),
                            // Container( height: 10,),
                            // Text(userList[index].kill.toString()),
                            // Container( height: 10,),
                            // Text(userList[index].isAlive.toString()),
                            // Container( height: 10,),
                            // Text(userList[index].damage.toString()),
                            //  Container( height: 30,),
                             ), 
                          ],
                        ),
                      ),
                      
                      
                      );
                  }
                ),)
              ],
            );
          },
         error: (err, s) => Text(err.toString()), 
         loading: ()=> const Center(
          child: CircularProgressIndicator(),
          )
         )
      ),
    );
  }
}


void apple(int a){
  debugPrint('$a');
}