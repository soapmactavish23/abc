import 'package:flutter/material.dart';
import 'package:loadmore_listview/loadmore_listview.dart';
import 'package:provider/provider.dart';
import 'package:radar_peconhento_mobile/main_package/components/lists/not_found.dart';
import 'package:radar_peconhento_mobile/main_package/components/utils/card_custom_image.dart';
import 'package:radar_peconhento_mobile/main_package/routes/routes_name.dart';
import 'package:radar_peconhento_mobile/models/class/category.dart';
import 'package:radar_peconhento_mobile/providers/animal/animal_provider_impl.dart';
import 'package:radar_peconhento_mobile/providers/category/category_provider_impl.dart';
import 'package:radar_peconhento_mobile/views/base/components/drawer_custom.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CategoryProviderImpl>();
    return Scaffold(
      drawer: const DrawerCustom(),
      appBar: AppBar(
        title: const Text('Categorias'),
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
              onLoadMore: () async {
                provider.findAll();
              },
              onRefresh: () async {
                provider.findAll();
              },
              itemCount: provider.list.length,
              itemBuilder: (_, index) {
                Category obj = provider.list[index];
                return CardCustomImage(
                  title: obj.name!,
                  image: obj.url!,
                  onTap: () {
                    final animalProvider = context.read<AnimalProviderImpl>();
                    animalProvider.categoryId = obj.id!;
                    animalProvider.findByCategory();
                    Navigator.pushNamed(context, RoutesName.animalList);
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
