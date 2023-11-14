import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddressAutoCompleteWidget extends StatefulWidget {
  @override
  _AddressAutoCompleteWidgetState createState() =>
      _AddressAutoCompleteWidgetState();
}

class _AddressAutoCompleteWidgetState extends State<AddressAutoCompleteWidget> {
  final TextEditingController _addressController = TextEditingController();
  List<String> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Search Address',
            style: TextStyle(color: Colors.grey),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                  labelText: 'Enter Address', hintText: "Start typing"),
              onChanged: _onAddressChanged,
            ),
            _suggestions.isNotEmpty
                ? Column(
                    children: _suggestions
                        .map((suggestion) => ListTile(
                              title: Text(suggestion),
                              onTap: () {
                                _addressController.text = suggestion;
                                _suggestions.clear();
                                Navigator.pop(context, suggestion);
                              },
                            ))
                        .toList(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void _onAddressChanged(String input) {
    if (input.isEmpty) {
      setState(() {
        _suggestions.clear();
      });
      return;
    }

    const apiKey =
        'AIzaSyDzrs8ZFG7ov2TRmmnNdsNnTzSaAtmIrN8'; // Replace with your Google Places API key
    const endpoint =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    final inputText = Uri.encodeQueryComponent(input);

    final url =
        '$endpoint?input=$inputText&key=$apiKey&fields=address_component';

    http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final predictions = data['predictions'] as List<dynamic>;
        print(data);
        setState(() {
          _suggestions = predictions
              .map((prediction) => prediction['description'])
              .cast<String>()
              .toList();
        });
      }
    });
  }
}
