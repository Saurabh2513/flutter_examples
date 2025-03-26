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

  _loadStudents() async {
    final studentList = await DatabaseHelper.instance.getStudents();
    setState(() {
      students = studentList;
    });
  }

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
