import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final classes = [
      {'subject': 'Math', 'time': '09:00 - 10:30'},
      {'subject': 'Algorithms', 'time': '11:00 - 12:30'},
      {'subject': 'Databases', 'time': '14:00 - 15:30'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Schedule')),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final c = classes[index];
          return ListTile(
            leading: const Icon(Icons.book),
            title: Text(c['subject']!),
            subtitle: Text(c['time']!),
          );
        },
      ),
    );
  }
}
