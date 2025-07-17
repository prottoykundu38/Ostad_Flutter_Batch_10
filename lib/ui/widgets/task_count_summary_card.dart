import 'package:flutter/material.dart';

class taskCount_SummaryCard extends StatelessWidget {
  const taskCount_SummaryCard({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$count',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(title,maxLines: 1,),
          ],
        ),
      ),
    );
  }
}
