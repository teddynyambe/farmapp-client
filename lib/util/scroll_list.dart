import 'package:flutter/material.dart';

class FarmItem {
  final indexItem;
  bool selected;
  FarmItem({this.indexItem, required this.selected});
}

class ScrollList extends ChangeNotifier {
  List<FarmItem> farmList = [];
  initial(List<int> indexItems) {
    farmList.clear();
    indexItems.forEach((element) {
      farmList.add(
          FarmItem(indexItem: element, selected: element == 0 ? true : false));
    });
    notifyListeners();
  }

  updateList(int indexItem, bool selected) {
    farmList.forEach((element) {
      element.selected = false;
    });
    farmList.where((element) => element.indexItem == indexItem).first.selected =
        true;
    notifyListeners();
  }
}
