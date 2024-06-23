import 'package:auth_app/features/personalization/screens/add_new_task_screen.dart';
import 'package:auth_app/features/personalization/screens/auth/sign_in_screen.dart';
import 'package:auth_app/features/personalization/widgets/profile_app_bar.dart';
import 'package:auth_app/features/personalization/widgets/summary_card.dart';
import 'package:auth_app/features/personalization/widgets/task_item.dart';
import 'package:auth_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildSummarySection(),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const TaskItem();
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.themeColor,
        onPressed: _onTapAddButton,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _onTapAddButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );
  }

  Widget _buildSummarySection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SummaryCardWidget(
            title: 'New Task',
            count: '12',
          ),
          SummaryCardWidget(
            title: 'Completed',
            count: '15',
          ),
          SummaryCardWidget(
            title: 'Cancelled',
            count: '32',
          ),
          SummaryCardWidget(
            title: 'In Progress',
            count: '09',
          ),
        ],
      ),
    );
  }
}
