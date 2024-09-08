import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
class PurposesViewModel extends ChangeNotifier{
  List _purposesList = [];
  List get purposesList => _purposesList;

  void addPurposesToList(String purposes){
    _purposesList.add(purposes);
    notifyListeners();
  }
}