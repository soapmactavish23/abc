// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/main_package/components/search/search_dialog.dart';

IconButton iconSearch(
    {required BuildContext context,
    Function(String search)? onSearch,
    String? hintText = 'Pesquisar',
    TextInputType? inputType}) {
  return IconButton(
    icon: const Icon(Icons.search),
    onPressed: () async {
      final search = await showDialog<String>(
        context: context,
        builder: (_) => Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: SearchDialog(
            initialText: "",
            inputType: inputType,
            hintText: hintText,
          ),
        ),
      );
      onSearch!(search.toString());
    },
  );
}
