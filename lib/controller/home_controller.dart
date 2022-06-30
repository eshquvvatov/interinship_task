import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interinship_task/model/user_model.dart';
import 'package:interinship_task/network_service/network_service.dart';

class HomeController extends ChangeNotifier {
bool isLoading=false;
 List <User>? users;

 Future<void> addList()async {
   isLoading=true;
   notifyListeners();
   var response = await NetworkService.GET();
   users= userFromJson(response!);
   notifyListeners();
   isLoading=false;
   notifyListeners();
 }
}