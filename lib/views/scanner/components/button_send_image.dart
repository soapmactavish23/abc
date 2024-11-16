import 'package:flutter/material.dart';

class ButtonSendImage extends StatelessWidget {
  final void Function()? onPressed;
  const ButtonSendImage({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: OutlinedButton(
        onPressed: onPressed,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.camera_alt),
              ),
              Text(
                'Enviar Foto',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
