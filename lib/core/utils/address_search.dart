import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/core/utils/place_service.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  AddressSearch(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  final sessionToken;
  PlaceApiProvider? apiClient;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
        close(context, null!);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null!;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query == ""
          ? null
          : apiClient!.fetchSuggestions(
              query, Localizations.localeOf(context).languageCode),
      builder: (context, snapshot) => query == ''
          ? const Center(child: Text("Search Location"))
          : snapshot.hasData
              ? ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black,
                  ),
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.h),
                    title: Text((snapshot.data![index]).description),
                    onTap: () {
                      close(context, snapshot.data![index]);
                    },
                  ),
                  itemCount: snapshot.data!.length,
                )
              : const Center(child: Text('Loading...')),
    );
  }
}
