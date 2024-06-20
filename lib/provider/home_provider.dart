import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuotesProvider extends ChangeNotifier {
  int ipage = 1;
  List<Map<String, dynamic>> likedQuotes = [];

  List<Map<String, dynamic>> get _likedQuotes => likedQuotes;

  QuotesProvider() {
    loadLikedQuotes();
  }

  void nextPage() {
    ipage++;
    notifyListeners();
  }

  void previousPage() {
    if (ipage > 1) {
      ipage--;
      notifyListeners();
    }
  }

  void addToLikedQuotes(Map<String, dynamic> quote) {
    likedQuotes.add(quote);
    saveLikedQuotes();
    notifyListeners();
  }

  void unlikeQuote(dynamic quote) {
    likedQuotes.remove(quote);
    saveLikedQuotes();
    notifyListeners();
  }

  void saveLikedQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('likedQuotes', jsonEncode(likedQuotes));
  }

  void loadLikedQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? likedQuotesJson = prefs.getString('likedQuotes');
    if (likedQuotesJson != null) {
      likedQuotes = (jsonDecode(likedQuotesJson) as List<dynamic>)
          .cast<Map<String, dynamic>>();
    }
    notifyListeners();
  }
}
