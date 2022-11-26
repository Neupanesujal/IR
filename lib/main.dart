import 'dart:async';
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
  var data = ApiServices();
  newFunction() {
    print(data.health);
  }

  @override
  Widget build(BuildContext context, ref) {
    var _data = ref.watch(userDataProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Image.asset(
              'images/ntec.png',
            ),
          ),
          body: _data.when(
              data: (recievedData) {
                List<userModel> userList = recievedData.map((e) => e).toList();
                Timer.periodic(Duration(seconds: 1), (timer) {
                  var _newData = ref.watch(userDataProvider);

                  _newData.whenData((value) {
                    value.forEach((element) {
                      userModel user =
                          recievedData.firstWhere((e) => e.id == element.id);
                      if (user.isAlive != element.isAlive) {
                        print(
                            " User ${user.id} ${element.isAlive ?? false ? "is alive" : "was killed"}");
                      }
                    });
                  });
                  _data = _newData;
                });

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return Card(
                              color: Color(0x7ED957), //7ed957
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
                          }),
                    )
                  ],
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }
}

void apple(int a) {
  debugPrint('$a');
}
