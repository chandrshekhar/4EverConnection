import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchDropDownWidget extends StatelessWidget {
  final TextEditingController? controller;
  final dynamic model;
  final List<dynamic> list;
  final Function(dynamic)? onSuggestionSelected;
  final String? lableName;
  final FutureOr<Iterable<dynamic>> Function(String) suggestionsCallback;
  final String fromWhere;
  const SearchDropDownWidget(
      {super.key,
      this.controller,
      this.model,
      required this.list,
      this.onSuggestionSelected,
      this.lableName,
      required this.suggestionsCallback,
      required this.fromWhere});

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<dynamic>(
      debounceDuration: const Duration(microseconds: 500),
      getImmediateSuggestions: true,
      textFieldConfiguration: TextFieldConfiguration(
        controller: controller,
        decoration: InputDecoration(
          labelText: lableName ?? "Select",
          suffix: InkWell(
            onTap: () {
              controller?.clear();
            },
            child: Icon(Icons.close, size: 16,),
          ),
        ),
      ),
      suggestionsCallback: suggestionsCallback,
      itemBuilder: (context, suggestion) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(fromWhere.toString() == "service"
              ? suggestion.name ?? ""
              : suggestion.fullName ?? ""),
        );
      },
      onSuggestionSelected: onSuggestionSelected ?? (selection) {},
      noItemsFoundBuilder: (context) {
        return const ListTile(
          title: Text("No items found"),
        );
      },
    );
  }
}
