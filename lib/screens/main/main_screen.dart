import 'package:flutter/material.dart';
import 'package:gym_app/provider/main/index_nav_provider.dart';
import 'package:gym_app/screens/class/class_screen.dart';
import 'package:gym_app/screens/home/home_screen.dart';
import 'package:gym_app/screens/profile/profile_screen.dart';
import 'package:gym_app/screens/trainer/trainer_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNavbar) {
            0 => const HomeScreen(),
            1 => const ClassScreen(),
            2 => const TrainerScreen(),
            3 => const ProfileScreen(),
            _ => const HomeScreen(),
          };
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<IndexNavProvider>().indexBottomNavbar,
        onTap: (index) {
          context.read<IndexNavProvider>().setIndexBottomNavbar = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: "Classes",
            tooltip: "Classes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_people),
            label: "Trainer",
            tooltip: "Trainer",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Profile",
            tooltip: "Profile",
          ),
        ],
      ),
    );
  }
}
