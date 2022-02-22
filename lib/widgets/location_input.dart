import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewimageUrl;

  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewimageUrl == null
              ? Text(
                  'No location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewimageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current location'),
              onPressed: _getCurrentLocation,
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
              onPressed: () {},
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
