import 'package:flutter/material.dart';

class DropdownButtonCustom<T> extends StatelessWidget {
  final void Function(T?)? onChanged;
  final bool loading;
  final String label;
  final List<DropdownMenuItem<T>>? list;
  final T? value;

  const DropdownButtonCustom({
    super.key,
    required this.list,
    this.onChanged,
    required this.loading,
    required this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<T>(
            decoration: const InputDecoration(
              labelText: 'Selecione uma categoria',
              border: OutlineInputBorder(),
            ),
            items: list,
            value: loading ? null : value,
            onChanged: loading ? null : onChanged,
          ),
        ),
        Visibility(
          visible: loading,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
