import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar_peconhento_mobile/providers/core/page_manager.dart';
import 'package:radar_peconhento_mobile/views/category/category_view.dart';
import 'package:radar_peconhento_mobile/views/home/home_view.dart';
import 'package:radar_peconhento_mobile/views/scanner/scanner_view.dart';

class BaseView extends StatelessWidget {
  BaseView({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(_pageController),
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeView(),
              ScannerView(),
              CategoryView(),
            ],
          )
        ],
      ),
    );
  }
}
