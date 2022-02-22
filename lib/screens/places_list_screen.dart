import '../providers/great_places.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './add_place_screen.dart';
import 'place_detail_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: Text('Got No Places yet, Start Adding now'),
                    builder: (ctx, greatPlaces, ch) =>
                        greatPlaces.items.length <= 0
                            ? ch!
                            : ListView.builder(
                                itemCount: greatPlaces.items.length,
                                itemBuilder: (ctx, i) => ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          FileImage(greatPlaces.items[i].image),
                                    ),
                                    title: Text(greatPlaces.items[i].title),
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          PlaceDetailScreen.routeName,
                                          arguments: greatPlaces.items[i].id);
                                    }
                                    //GoToDetailPage
                                    ),
                              ),
                  ),
      ),
    );
  }
}
