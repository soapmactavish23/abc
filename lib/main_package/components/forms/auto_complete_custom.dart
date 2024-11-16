// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:validadores/Validador.dart';
import 'package:radar_peconhento_mobile/main_package/components/forms/input_custom.dart';

abstract class AutoCompleteMethods {
  static Widget getFieldViewBuilder({
    required BuildContext context,
    required TextEditingController textEditingController,
    required FocusNode focusNode,
    required VoidCallback onFieldSubmitted,
    required String hintText,
    required String label,
    required IconData iconData,
  }) {
    return InputCustom(
      focusNode: focusNode,
      controller: textEditingController,
      hintText: hintText,
      icon: Icon(iconData),
      label: label,
      validator: (value) => Validador()
          .add(
            Validar.OBRIGATORIO,
            msg: "Campo Obrigatório",
          )
          .validar(value),
    );
  }

  static Widget getOptionsViewBuilder(
      {required Iterable<dynamic> options,
      required Widget Function(BuildContext, int) itemBuilder}) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 200,
            maxWidth: 600,
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: itemBuilder,
          ),
        ),
      ),
    );
  }

  static Widget getListTile(
      {required String title,
      required String subtitle,
      required IconData iconData,
      required void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
      ),
    );
  }
}
