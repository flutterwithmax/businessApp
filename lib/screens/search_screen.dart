import '/models/word_cart.dart';
import '/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<WordCart> users = [
    WordCart(
      engword: 'to achieve',
      transcription: 'achiv',
      uzword: 'erishmoq',
    ),
    WordCart(
      uzword: 'kelishmoq/muzokara olib bormoq',
      engword: 'to negotiate',
      transcription: "/nɪˈɡoʊ.ʃi.eɪt/",
    ),
  ];

  List<WordCart> found_users = [];

  @override
  void initState() {
    found_users = users;
    super.initState();
  }

  void runFilter(String entredKeyWord) {
    List<WordCart> result = [];
    if (entredKeyWord.isEmpty) {
      result = users;
    } else {
      result = users
          .where((user) => user.uzword
              .toString()
              .toLowerCase()
              .contains(entredKeyWord.toLowerCase()))
          .toList();
    }
    setState(() {
      found_users = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            onChanged: (value) => runFilter(value),
            decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(
                  Icons.search,
                )),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3,
          margin: const EdgeInsets.all(12),
          child: const Column(
            children: [],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => CardHolder(
              uzWord: found_users[index].uzword,
              engWord: found_users[index].engword,
              transcription: found_users[index].transcription,
              title: '',
            ),
            itemCount: found_users.length,
          ),
        ),
      ]),
    );
  }
}
