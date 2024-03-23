import 'package:flutter/widgets.dart';

class NewsProvider extends ChangeNotifier{
  int chipIndex=0;
  void selectChip(int selectedChip){
    chipIndex = selectedChip;
    notifyListeners();
  }
}