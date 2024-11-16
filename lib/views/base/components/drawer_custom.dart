import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar_peconhento_mobile/main_package/theme/constants.dart';
import 'package:radar_peconhento_mobile/providers/core/page_manager.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Image.asset(
                ImagesConstants.imageLogo,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              context.read<PageManager>().setPage(PageManager.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Scannear animal'),
            onTap: () {
              context.read<PageManager>().setPage(PageManager.scanner);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Manual de animais'),
            onTap: () {
              context.read<PageManager>().setPage(PageManager.categoryList);
            },
          ),
        ],
      ),
    );
  }
}
