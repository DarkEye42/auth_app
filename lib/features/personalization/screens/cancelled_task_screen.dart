import 'package:auth_app/features/personalization/widgets/profile_app_bar.dart';
import 'package:auth_app/features/personalization/widgets/task_item.dart';
import 'package:flutter/material.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const TaskItem();
        },
      ),
    );
  }
}
