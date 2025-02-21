import 'package:flutter/material.dart';

class ErrorInfo extends StatelessWidget {
  final String title;
  final String message;

  const ErrorInfo({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).cardColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
