import 'package:flutter/material.dart';
import 'package:loadmore_listview/loadmore_listview.dart';
import 'package:provider/provider.dart';
import 'package:radar_peconhento_mobile/main_package/components/lists/not_found.dart';
import 'package:radar_peconhento_mobile/main_package/components/utils/card_custom_image.dart';
import 'package:radar_peconhento_mobile/main_package/routes/routes_name.dart';
import 'package:radar_peconhento_mobile/models/class/animal.dart';
import 'package:radar_peconhento_mobile/providers/accident/accident_provider_impl.dart';
import 'package:radar_peconhento_mobile/providers/animal/animal_provider_impl.dart';

class AnimalView extends StatelessWidget {
  const AnimalView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AnimalProviderImpl>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animais'),
      ),
      body: ChangeNotifierProvider.value(
        value: provider,
        builder: (_, __) {
          if (provider.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.list.isEmpty) {
            return const NotFound();
          } else {
            return LoadMoreListView.builder(
              onRefresh: () async {
                provider.findByCategory();
              },
              onLoadMore: () async {
                provider.findByCategory();
              },
              itemCount: provider.list.length,
              itemBuilder: (_, index) {
                Animal obj = provider.list[index];
                return CardCustomImage(
                  title: obj.name!,
                  subtitle: Text(obj.scientificName!),
                  image: obj.url!,
                  onTap: () {
                    provider.obj = obj;
                    final accidentProvider =
                        context.read<AccidentProviderImpl>();
                    accidentProvider.findByAnimal(obj.id!);
                    Navigator.of(context).pushNamed(RoutesName.accidentList);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
