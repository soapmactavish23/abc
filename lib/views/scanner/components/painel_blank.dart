import 'package:flutter/material.dart';

class PainelBlank extends StatelessWidget {
  const PainelBlank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 400,
      child: const Center(
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
