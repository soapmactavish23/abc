import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar_peconhento_mobile/providers/accident/accident_provider_impl.dart';
import 'package:radar_peconhento_mobile/providers/animal/animal_provider_impl.dart';
import 'package:radar_peconhento_mobile/providers/category/category_provider_impl.dart';
import 'package:radar_peconhento_mobile/providers/occurrence/occurrence_provider_impl.dart';

class ApplicationProvider extends StatelessWidget {
  final Widget materialApp;
  const ApplicationProvider({super.key, required this.materialApp});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProviderImpl(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => AnimalProviderImpl(),
        ),
        ChangeNotifierProvider(
          create: (_) => AccidentProviderImpl(),
        ),
        ChangeNotifierProvider(
          create: (_) => OccurrenceProviderImpl(),
        )
      ],
      child: materialApp,
    );
  }
}
