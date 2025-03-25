import 'package:flutter/material.dart';
import 'package:student_leaderboard/services/database_servics.dart';

import 'leader_board_screen.dart';

void main() {
  runApp(StudentLeaderboardApp());
}

class StudentLeaderboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DatabaseService _databaseService = DatabaseService.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Leaderboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LeaderboardScreen(),
    );
  }
}



