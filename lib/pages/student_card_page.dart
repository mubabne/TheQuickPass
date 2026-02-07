import 'package:flutter/material.dart';

class StudentCardPage extends StatelessWidget {
  const StudentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Card')),
      body: Center(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.school, size: 80, color: Colors.indigo),
                SizedBox(height: 12),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text('Computer Science'),
                SizedBox(height: 12),
                Divider(),
                Text('Student ID: 20240123'),
                Text('Year: 2'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
