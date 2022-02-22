import 'package:flutter/cupertino.dart';
import '../models/place.dart';
import 'dart:io';
import '../helpers/dp_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((e) => e.id == id);
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: null,
        image: image);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((e) => Place(
            id: e['id'],
            title: e['title'],
            location: null,
            image: File(e['image'])))
        .toList();
    notifyListeners();
  }
}
