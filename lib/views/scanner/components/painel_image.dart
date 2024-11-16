import 'dart:io';

import 'package:flutter/material.dart';

class PainelImage extends StatelessWidget {
  final String path;
  const PainelImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Image.file(
        File(path),
        fit: BoxFit.cover,
      ),
    );
  }
}
