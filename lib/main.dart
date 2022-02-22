import 'package:feature/providers/great_places.dart';
import 'package:feature/screens/place_detail_screen.dart';
import 'package:feature/screens/places_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/add_place_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      // create: (_) {
      //   GreatPlaces();
      // },
      
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
PlaceDetailScreen.routeName:(ctx)=> PlaceDetailScreen(),
        },
      ),
    );
  }
}
