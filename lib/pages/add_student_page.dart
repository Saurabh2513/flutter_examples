import 'package:flutter/material.dart';
import 'database_helper.dart';

class AddStudentPage extends StatefulWidget {
  final VoidCallback onStudentAdded;

  AddStudentPage({required this.onStudentAdded});

  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _nameController = TextEditingController();
  final _subject1Controller = TextEditingController();
  final _subject2Controller = TextEditingController();
  final _subject3Controller = TextEditingController();
  final _subject4Controller = TextEditingController();
  final _subject5Controller = TextEditingController();

  // Function to add student to the database
  _addStudent() async {
    final name = _nameController.text;
    final subject1 = int.tryParse(_subject1Controller.text) ?? 0;
    final subject2 = int.tryParse(_subject2Controller.text) ?? 0;
    final subject3 = int.tryParse(_subject3Controller.text) ?? 0;
    final subject4 = int.tryParse(_subject4Controller.text) ?? 0;
    final subject5 = int.tryParse(_subject5Controller.text) ?? 0;

    if (name.isNotEmpty) {
      // Calculate percentage
      final percentage = ((subject1 + subject2 + subject3 + subject4 + subject5) / 500) * 100;

      final student = {
        'name': name,
        'subject1': subject1,
        'subject2': subject2,
        'subject3': subject3,
        'subject4': subject4,
        'subject5': subject5,
        'percentage': percentage.toInt(),  // Store percentage as an integer
      };

      // Insert the student into the database
      await DatabaseHelper.instance.insertStudent(student);

      // Refresh the student list in the first page
      widget.onStudentAdded();

      // Go back to the first page
      Navigator.pop(context);
    } else {
      // Show an error if the name field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a student name!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student Marks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Student Name'),
            ),
            TextField(
              controller: _subject1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Subject 1'),
            ),
            TextField(
              controller: _subject2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Subject 2'),
            ),
            TextField(
              controller: _subject3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Subject 3'),
            ),
            TextField(
              controller: _subject4Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Subject 4'),
            ),
            TextField(
              controller: _subject5Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Subject 5'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addStudent,  // Call the method when Save is clicked
              child: Text('Save Student'),
            ),
          ],
        ),
      ),
    );
  }
}
