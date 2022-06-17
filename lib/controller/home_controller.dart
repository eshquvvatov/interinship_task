import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interinship_task/model/user_model.dart';
import 'package:interinship_task/network_service/network_service.dart';

class HomeController extends ChangeNotifier {

 List <User> users=[];

 void addList(){
   users= userFromJson(jsonEncode(NetworkService.GET()));
   notifyListeners();
 }
}