// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ExpansionTileCustom extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final void Function(bool)? onExpansionChanged;
  final bool initiallyExpanded;
  final IconData? iconData;
  final Color? colorTitle;

  const ExpansionTileCustom({
    Key? key,
    required this.title,
    required this.children,
    this.onExpansionChanged,
    this.initiallyExpanded = false,
    this.iconData,
    this.colorTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ExpansionTile(
        title: ListTile(
          leading: Icon(
            iconData,
            color: colorTitle ?? Theme.of(context).primaryColor,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: colorTitle ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 18.0),
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        onExpansionChanged: onExpansionChanged,
        initiallyExpanded: initiallyExpanded,
        children: children,
      ),
    );
  }
}
