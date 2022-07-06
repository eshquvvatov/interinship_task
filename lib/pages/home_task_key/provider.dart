import 'package:flutter/material.dart';

class Home_task_keyProvider extends ChangeNotifier {
List<String> numbers=["1","2","3","4","5","6","7","8","9",];
List<String> numbersText=["one","two","three","four","five","six","seven","eight","nine",];
 bool isTap=false;
 int tapIndex=0;
void addElementList(String text,int index){
 isTap =true;
 tapIndex=index;
 notifyListeners();
}
}
