import 'package:basics/app/core/helpers/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

class AdressNominatimPage extends StatefulWidget {
  const AdressNominatimPage({super.key});

  @override
  State<AdressNominatimPage> createState() => _AdressNominatimPageState();
}

class _AdressNominatimPageState extends State<AdressNominatimPage> {
  final debouncer = Debouncer(milliseconds: 1000);

  Future getAdress({String value = ''}) async {
    final searchResult = await Nominatim.searchByName(
      query: value,
      limit: 10,
      addressDetails: true,
      extraTags: true,
      nameDetails: true,
    );

    if (searchResult.isEmpty) {
      return;
    }

    for (var element in searchResult) {
      debugPrint('##################');
      print(element.displayName);
      debugPrint('##################');
    }

    /*debugPrint('##################');

    print(searchResult.single.displayName);
    print(searchResult.single.address);
    print(searchResult.single.extraTags);
    print(searchResult.single.nameDetails);

    print('');
    */

    /*

    final reverseSearchResult = await Nominatim.reverseSearch(
      lat: 50.1,
      lon: 6.2,
      addressDetails: true,
      extraTags: true,
      nameDetails: true,
    );
    print(reverseSearchResult.displayName);
    print(reverseSearchResult.address);
    print(reverseSearchResult.extraTags);
    print(reverseSearchResult.nameDetails);
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adress Nominatim'),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: TextFormField(
            onChanged: (value) {
              debouncer.run(() {
                // ignore: unnecessary_brace_in_string_interps
                value = ('${value}, Presidente Prudente, São Paulo').toLowerCase();
                print(value);
                getAdress(value: value);
              });
            },
            decoration: const InputDecoration(
              labelText: 'Pesquisar',
            ),
          ),
        ),
      ),
    );
  }
}
