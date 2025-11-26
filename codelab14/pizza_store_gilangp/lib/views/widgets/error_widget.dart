import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorStateWidget({
    super.key,
    this.errorMessage = 'Gagal mengambil data pizza',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 80, color: Colors.red),
          const SizedBox(height: 16),
          const Text(
            'Oops! Sesuatu salah',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(errorMessage, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }
}
