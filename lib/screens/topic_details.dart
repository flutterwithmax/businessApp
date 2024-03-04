import '/models/topic.dart';
import '/widgets/card.dart';
import '/widgets/card_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key, required this.topic});
  final Topic topic;

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  List<CardHolderButtons> mylist2 = const [
    CardHolderButtons(
      uzWord: 'Xayrli tong! Siz yangi hamkasbmisiz? Ismingiz nima?',
      engWord: 'Good morning! Are you a new colleague? What is your name?',
      transcription:
          "/gʊd ˈmɔːrnɪŋ! ɑː juː ə nuː kɒlˈliːg? wɒt ɪz jɔː ˈneɪm? lon teks,/",
    ),
    CardHolderButtons(
      uzWord: 'Xayrli tong! Siz yangi hamkasbmisiz? Ismingiz nima?',
      engWord: 'Good morning! Are you a new colleague? What is your name?',
      transcription:
          "/gʊd ˈmɔːrnɪŋ! ɑː juː ə nuː kɒlˈliːg? wɒt ɪz jɔː ˈneɪm? lon teks,/",
    ),
    CardHolderButtons(
      uzWord: 'Xayrli tong! Siz yangi hamkasbmisiz? Ismingiz nima?',
      engWord: 'Good morning! Are you a new colleague? What is your name?',
      transcription:
          "/gʊd ˈmɔːrnɪŋ! ɑː juː ə nuː kɒlˈliːg? wɒt ɪz jɔː ˈneɪm? lon teks,/",
    ),
    CardHolderButtons(
      uzWord: 'Xayrli tong! Siz yangi hamkasbmisiz? Ismingiz nima?',
      engWord: 'Good morning! Are you a new colleague? What is your name?',
      transcription:
          "/gʊd ˈmɔːrnɪŋ! ɑː juː ə nuː kɒlˈliːg? wɒt ɪz jɔː ˈneɪm? lon teks,/",
    ),
  ];

  List<CardHolder> mylist = const [
    CardHolder(
      uzWord: 'kelishmoq/muzokara olib bormoq',
      engWord: 'to negotiate',
      transcription: "/nɪˈɡoʊ.ʃi.eɪt/",
      title: '*Salomlashish',
    ),
    CardHolder(
      uzWord: 'kelishmoq/muzokara olib bormoq',
      engWord: 'to negotiate',
      transcription: "/nɪˈɡoʊ.ʃi.eɪt/",
      title: '*Salomlashish',
    ),
    CardHolder(
      uzWord: 'kelishmoq/muzokara olib bormoq',
      engWord: 'to negotiate',
      transcription: "/nɪˈɡoʊ.ʃi.eɪt/",
      title: '*Salomlashish',
    ),
    CardHolder(
      uzWord: 'kelishmoq/muzokara olib bormoq',
      engWord: 'to negotiate',
      transcription: "/nɪˈɡoʊ.ʃi.eɪt/",
      title: '*Salomlashish',
    ),
    CardHolder(
      uzWord: 'kelishmoq/muzokara olib bormoq',
      engWord: 'to negotiate',
      transcription: "/nɪˈɡoʊ.ʃi.eɪt/",
      title: '*Salomlashish',
    ),
    CardHolder(
      uzWord: 'kelishmoq/muzokara olib bormoq',
      engWord: 'to negotiate',
      transcription: "/nɪˈɡoʊ.ʃi.eɪt/",
      title: '*Salomlashish',
    ),
    CardHolder(
      uzWord: 'kelishmoq/muzokara olib bormoq',
      engWord: 'to negotiate',
      transcription: "/nɪˈɡoʊ.ʃi.eɪt/",
      title: '*Salomlashish*',
    ),
  ];
  int phraseOrVocab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.topic.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: CupertinoSlidingSegmentedControl(
                    padding: const EdgeInsets.all(5),
                    groupValue: phraseOrVocab,
                    children: {
                      0: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: Text(
                          'Phrases',
                          style: phraseOrVocab == 0
                              ? const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)
                              : const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black54),
                        ),
                      ),
                      1: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Text(
                          'Vocabulary',
                          style: phraseOrVocab == 1
                              ? const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)
                              : const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black54),
                        ),
                      ),
                    },
                    onValueChanged: (value) => setState(() {
                      phraseOrVocab = value!;
                    }),
                  ),
                ),
              ],
            ),
          ),
          if (phraseOrVocab == 1)
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: mylist[index],
                ),
                itemCount: mylist.length,
              ),
            ),
          if (phraseOrVocab == 0)
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: mylist2[index],
                ),
                itemCount: mylist2.length,
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(67, 244, 251, 100),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  padding: const EdgeInsets.only(
                    right: 50,
                    left: 50,
                    bottom: 10,
                    top: 10,
                  ),
                ),
                onPressed: () {},
                child: const Text('TEST'),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.downloading_sharp,
                  size: 35,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle_outline,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
