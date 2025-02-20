import 'package:flutter/material.dart';

class EmptyInfo extends StatelessWidget {
  final String? info;

  const EmptyInfo({
    super.key,
    this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(info ?? 'Empty data'),
    );
  }
}
