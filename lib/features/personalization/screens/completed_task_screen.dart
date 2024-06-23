import 'package:auth_app/features/personalization/widgets/profile_app_bar.dart';
import 'package:auth_app/features/personalization/widgets/task_item.dart';
import 'package:flutter/material.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
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
