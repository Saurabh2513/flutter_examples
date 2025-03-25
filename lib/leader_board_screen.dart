import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0, // Remove default shadow
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade600, // Your custom border color
            width: 1, // Border thickness
          ),
        ),
        title: Text('Student Leaderboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // Header Row
            const Row(
              children: [
                SizedBox(width: 40, child: Text('Rank', style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(width: 10),
                Expanded(child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(width: 10),
                SizedBox(width: 80, child: Text('Percentage', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            const SizedBox(height: 8),
            Divider(thickness: 1),
            const SizedBox(height: 8),

            // Student List

          ],
        ),
      ),
    );
  }
}