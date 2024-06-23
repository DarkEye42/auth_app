import 'package:flutter/material.dart';

class SummaryCardWidget extends StatelessWidget {
  const SummaryCardWidget({
    super.key,
    required this.title,
    required this.count,
  });

  final String title, count;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              count,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}