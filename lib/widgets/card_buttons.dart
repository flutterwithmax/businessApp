import 'package:flutter/material.dart';

class CardHolderButtons extends StatelessWidget {
  const CardHolderButtons({
    super.key,
    required this.uzWord,
    required this.engWord,
    required this.transcription,
  });
  final String uzWord;
  final String engWord;
  final String transcription;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(67, 244, 251, 100),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Text(
                uzWord,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 136,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(engWord),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        transcription,
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_circle_outline,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      iconSize: 35,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      iconSize: 35,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
