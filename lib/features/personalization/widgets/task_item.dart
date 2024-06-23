import 'package:auth_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        title: const Text('This is a title'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('This is an example of description'),
            const Text('Date: 15/05/2024', style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: const Text(
                    'New',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: AppColors.themeColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12, vertical: 0,
                  ),
                ),
                ButtonBar(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.delete_rounded, color: Colors.redAccent,)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit, color: Colors.blueGrey)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}