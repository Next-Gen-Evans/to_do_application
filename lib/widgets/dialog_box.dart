import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String text;
  final Function() onSave;
  final contoller;
  const DialogBox({
    super.key,
    required this.text,
    required this.onSave,
    required this.contoller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.tealAccent,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
              controller: contoller,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: onSave, child: Text(text)),
          ],
        ),
      ),
    );
  }
}
