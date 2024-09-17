// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ErrorDialog extends StatefulWidget {
  final String title;

  // ignore: use_super_parameters
  const ErrorDialog({Key? key, required this.title}) : super(key: key);

  @override
  State<ErrorDialog> createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title, style: const TextStyle(fontSize: 16)),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context, true), // passing true
          child: const Text('Got it', style:  TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
