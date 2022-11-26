
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbit/model/userModel.dart';
import 'package:orbit/new.dart';

final userDataProvider = FutureProvider<List<userModel>>((ref) async{
  return ref.watch(userProvider).getUsers();
});
