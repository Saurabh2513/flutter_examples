import 'package:flutter/material.dart';
import 'add_student_page.dart';
import 'database_helper.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  // Load students from the database
  _loadStudents() async {
    final studentList = await DatabaseHelper.instance.getStudents();
    studentList.sort((a, b) {
      double percentageA = calculatePercentage(a);
      double percentageB = calculatePercentage(b);
      return percentageB.compareTo(percentageA); // Sort descending by percentage
    });
    setState(() {
      students = studentList;
    });
  }

  // Calculate the percentage for each student
  double calculatePercentage(Map<String, dynamic> student) {
    int totalMarks = student['subject1'] +
        student['subject2'] +
        student['subject3'] +
        student['subject4'] +
        student['subject5'];
    return (totalMarks / 500) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Rankings'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          double percentage = calculatePercentage(student);
          return ListTile(
            title: Text(student['name']),
            subtitle: Text('Percentage: ${percentage.toStringAsFixed(2)}%'),
            trailing: Text('Rank: ${index + 1}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudentPage(onStudentAdded: _loadStudents)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
