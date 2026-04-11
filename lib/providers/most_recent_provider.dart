import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_prefs_helper.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecently = [];

  void readMostRecentSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentListAsString =
        prefs.getStringList(SharedPrefsKey.mostRecentKey) ?? [];
    mostRecently = mostRecentListAsString
        .map((element) => int.parse(element))
        .toList();
    notifyListeners();
  }
}
