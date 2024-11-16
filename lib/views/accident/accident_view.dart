import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar_peconhento_mobile/main_package/components/lists/not_found.dart';
import 'package:radar_peconhento_mobile/main_package/components/utils/divider_custom.dart';
import 'package:radar_peconhento_mobile/main_package/components/utils/expansion_tile_custom.dart';
import 'package:radar_peconhento_mobile/main_package/components/utils/text_span_tile.dart';
import 'package:radar_peconhento_mobile/main_package/theme/constants.dart';
import 'package:radar_peconhento_mobile/models/class/accident.dart';
import 'package:radar_peconhento_mobile/models/enums/danger.dart';
import 'package:radar_peconhento_mobile/models/enums/treatment_type.dart';
import 'package:radar_peconhento_mobile/providers/accident/accident_provider_impl.dart';
import 'package:radar_peconhento_mobile/providers/animal/animal_provider_impl.dart';

class AccidentView extends StatelessWidget {
  const AccidentView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AccidentProviderImpl>();
    final animal = context.watch<AnimalProviderImpl>().obj;

    Widget getListAccidents() {
      if (provider.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (provider.list.isEmpty) {
        return const NotFound();
      } else {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: provider.list.length,
          itemBuilder: (_, index) {
            Accident obj = provider.list[index];
            return ExpansionTileCustom(
              iconData: Icons.warning,
              title: DangerState.convertStr(obj.danger!),
              colorTitle: DangerState.convertEnumColor(obj.danger!),
              children: [
                ExpansionTileCustom(
                  iconData: Icons.dangerous,
                  title: 'Sintomas',
                  children: obj.symptoms!
                      .map<Widget>((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextSpanTile(
                              label: "Descrição do Sintoma: ",
                              value: e.description,
                            ),
                          ))
                      .toList(),
                ),
                ExpansionTileCustom(
                  iconData: Icons.edit_note_rounded,
                  title: 'Exames Laboratoriais',
                  children: obj.exams!
                      .map<Widget>((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextSpanTile(
                              label: "Descrição do Exame: ",
                              value: e.description,
                            ),
                          ))
                      .toList(),
                ),
                ExpansionTileCustom(
                  iconData: Icons.check_box,
                  title: 'Tratamentos',
                  children: obj.treatments!
                      .map<Widget>((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextSpanTile(
                                  label: "Tipo de Tratamento: ",
                                  value: TreatmentTypeState.convertStr(e.type),
                                ),
                                TextSpanTile(
                                  label: "Descrição do Tratamento: ",
                                  value: e.description,
                                ),
                                Visibility(
                                  visible: e.obs != "",
                                  child: TextSpanTile(
                                    label: "Observação: ",
                                    value: e.obs,
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Acidente por ${animal.name}'),
      ),
      body: ChangeNotifierProvider.value(
        value: provider,
        builder: (_, __) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  child: Image.network(
                    animal.url!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    animal.name!,
                    style: const TextStyle(
                      color: ColorsConstants.defaultColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    animal.scientificName!,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(animal.description!),
                ),
                const DividerCustom(
                  title: 'Tipos de Acidentes',
                ),
                getListAccidents(),
              ],
            ),
          );
        },
      ),
    );
  }
}
