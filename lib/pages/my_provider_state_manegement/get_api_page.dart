import 'package:flutter/material.dart';
import 'package:interinship_task/model/post_model.dart';
import 'package:interinship_task/network_service/network_service_http.dart';

class MyProvider extends ChangeNotifier {
  List<Post> posts = [];
bool isLoading=false;
  MyProvider() {
    print("***********************************************");
    print("Ishladi");
    getPosts();
  }

  void getPosts() async{
    isLoading=true;
    notifyListeners();
   var response=await Network.GET(Network.API_Get_LIST, Network.paramsEmpty());
    isLoading=false;
    notifyListeners();
    posts=Network.parseResponse(response!);
  }
}
