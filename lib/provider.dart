import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NBProvider with ChangeNotifier{

  int index = 0;


  changeIndex(int newIndex){
    index = newIndex;
    notifyListeners();}


}