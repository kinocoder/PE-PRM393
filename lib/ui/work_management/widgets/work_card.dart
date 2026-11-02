import 'package:flutter/material.dart';

import 'dart:math';

import '../../../data/model/work.dart';

class WorkCard extends StatelessWidget {
  final Work work;
  final VoidCallback onEdit;

  WorkCard({super.key,required this.work, required this.onEdit});

  List<IconData> subjectIcons = [
    Icons.computer,
    Icons.co_present,
    Icons.menu_book,
    Icons.edit_document,
    Icons.school,
  ];

  IconData getRandomIcon() {
    final random = Random();
    return subjectIcons[random.nextInt(subjectIcons.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Icon(getRandomIcon(), size: 40, color: Colors.blue),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${work.title}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${work.description}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }
}
