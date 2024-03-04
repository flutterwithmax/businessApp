import 'package:flutter/material.dart';

class TopicItem extends StatelessWidget {
  final String title;
  final String imgPath;
  const TopicItem({super.key, required this.title, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(67, 245, 251, 0.849),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imgPath,
            width: 55,
            height: 55,
          ),
          const SizedBox(
            height: 2,
          ),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
