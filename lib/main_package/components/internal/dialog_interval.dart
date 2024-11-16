import 'package:flutter/material.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:validadores/Validador.dart';
import 'package:radar_peconhento_mobile/main_package/components/forms/input_custom.dart';
import 'package:radar_peconhento_mobile/main_package/utils/date_time_custom.dart';

class DialogInterval extends StatefulWidget {
  final Function(String dt1, String dt2) onSend;
  const DialogInterval({Key? key, required this.onSend}) : super(key: key);

  @override
  State<DialogInterval> createState() => _DialogIntervalState();
}

class _DialogIntervalState extends State<DialogInterval> {
  // Controllers
  TextEditingController dt1EC = TextEditingController();
  TextEditingController dt2EC = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MaskInputFormatter dtFormatter = MaskInputFormatter(
    mask: '##/##/#### ##:##:##',
  );

  String dt1 = "";
  String dt2 = "";

  @override
  void initState() {
    super.initState();

    setState(() {
      dt1EC.text = DateTimeCustom.convertDateTimeInterval(
        date: DateTime.now(),
        isAfter: false,
      );
      dt2EC.text = DateTimeCustom.convertDateTimeInterval(
        date: DateTime.now(),
        isAfter: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(
                'Pesquisar Batidas Eletrônicas',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              content: Form(
                key: formKey,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  InputCustom(
                    controller: dt1EC,
                    textInputType: TextInputType.datetime,
                    inputFormatters: [
                      dtFormatter,
                    ],
                    hintText: "##/##/#### ##:##:##",
                    icon: const Icon(Icons.calendar_month),
                    label: "Data Inicial",
                    validator: (value) {
                      return Validador()
                          .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                          .validar(value);
                    },
                    onSaved: (value) {
                      DateTime? date =
                          DateTimeCustom.convertDateTimeInput(value);
                      dt1 = DateTimeCustom.convertToDtSend(date).toString();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputCustom(
                    controller: dt2EC,
                    textInputType: TextInputType.datetime,
                    inputFormatters: [
                      dtFormatter,
                    ],
                    hintText: "##/##/#### ##:##:##",
                    icon: const Icon(Icons.calendar_month),
                    label: "Data Final",
                    validator: (value) {
                      return Validador()
                          .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                          .validar(value);
                    },
                    onSaved: (value) {
                      DateTime? date =
                          DateTimeCustom.convertDateTimeInput(value);
                      dt2 = DateTimeCustom.convertToDtSend(date).toString();
                    },
                  ),
                ]),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      widget.onSend(dt1, dt2);
                    }
                  },
                  child: Text(
                    "Pesquisar",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
