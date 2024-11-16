import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.not_interested,
            size: 30,
            color: Theme.of(context).primaryColor.withAlpha(400),
          ),
          Text(
            'NENHUM REGISTRO ENCONTRADO',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor.withAlpha(400),
            ),
          ),
        ],
      ),
    );
  }
}
