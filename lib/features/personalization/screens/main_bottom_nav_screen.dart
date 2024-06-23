import 'package:auth_app/features/personalization/screens/cancelled_task_screen.dart';
import 'package:auth_app/features/personalization/screens/completed_task_screen.dart';
import 'package:auth_app/features/personalization/screens/in_progress_task_screen.dart';
import 'package:auth_app/features/personalization/screens/new_task_screen.dart';
import 'package:auth_app/features/personalization/widgets/profile_app_bar.dart';
import 'package:auth_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    InProgressTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          _selectedIndex = index;
          if(mounted){
            setState(() {});
          }
        },
        selectedItemColor: AppColors.themeColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.view_list_outlined), label: 'New Task'),
          BottomNavigationBarItem(icon: Icon(Icons.done_outline), label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: 'Cancelled'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_add_rounded), label: 'Progress'),
        ],
      ),

    );
  }
}
