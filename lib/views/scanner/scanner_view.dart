// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:radar_peconhento_mobile/main_package/components/images/image_custom.dart';
import 'package:radar_peconhento_mobile/main_package/components/utils/dialog_custom.dart';
import 'package:radar_peconhento_mobile/main_package/routes/routes_name.dart';
import 'package:radar_peconhento_mobile/main_package/theme/constants.dart';
import 'package:radar_peconhento_mobile/models/class/animal.dart';
import 'package:radar_peconhento_mobile/models/class/category.dart';
import 'package:radar_peconhento_mobile/providers/accident/accident_provider_impl.dart';
import 'package:radar_peconhento_mobile/providers/animal/animal_provider_impl.dart';
import 'package:radar_peconhento_mobile/providers/category/category_provider_impl.dart';
import 'package:radar_peconhento_mobile/providers/occurrence/occurrence_provider_impl.dart';
import 'package:radar_peconhento_mobile/views/base/components/drawer_custom.dart';
import 'package:radar_peconhento_mobile/views/scanner/components/button_send_image.dart';
import 'package:radar_peconhento_mobile/views/scanner/components/dropdown_button_custom.dart';
import 'package:radar_peconhento_mobile/views/scanner/components/painel_blank.dart';
import 'package:radar_peconhento_mobile/views/scanner/components/painel_image.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  final ImagePicker _picker = ImagePicker();
  Animal? _selectedAnimal;
  XFile? image;
  double? latitude;
  double? longitude;

  Future<void> _sendOccurrence() async {
    final provider = context.read<OccurrenceProviderImpl>();
    provider
        .register(
      image: File(image!.path),
      latitude: latitude!,
      longitude: longitude!,
      animalSupposedId: _selectedAnimal!.id,
      categoryId: _selectedAnimal!.category!.id!,
    )
        .then((value) {
      Navigator.pop(context);
      final animalId = provider.obj.animal!.id;
      final accidentProvider = context.read<AccidentProviderImpl>();
      context.read<AnimalProviderImpl>().obj = provider.obj.animal!;
      accidentProvider.findByAnimal(animalId!);
      Navigator.of(context).pushNamed(RoutesName.accidentList);
    }).catchError((err) {
      Navigator.pop(context);
      DialogCustom.dialogError(
        context: context,
        msg: 'Não foi possível identificar o animal',
      );
    });
  }

  bool isValid() {
    bool result = true;
    if (image == null) {
      result = false;
    }

    if (_selectedAnimal == null) {
      result = false;
    }
    return result;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final provider = context.read<CategoryProviderImpl>();
      provider.findByAnimalActive();
    });
    getImage();
    super.initState();
  }

  Future<void> saveImage(XFile? selectedImage) async {
    if (selectedImage != null) {
      await cropImage(selectedImage);

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      prefs.setDouble("latitude", position.latitude);
      prefs.setDouble("longitude", position.longitude);
      prefs.setString("image", image!.path);
    }
  }

  Future<void> getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    latitude = prefs.getDouble("latitude");
    longitude = prefs.getDouble("longitude");
    image = XFile(prefs.getString("image")!);
  }

  Future<void> cropImage(XFile selectedImage) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: selectedImage.path,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Editar Imagem',
          toolbarColor: Theme.of(context).primaryColor,
          toolbarWidgetColor: Colors.white,
        )
      ],
    );
    if (croppedFile != null) {
      setState(() {
        image = XFile(croppedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final animalProvider = context.watch<AnimalProviderImpl>();

    Widget getImage() {
      if (_selectedAnimal == null || _selectedAnimal?.id == null) {
        return Image.asset(
          'images/supposed.png',
          width: 100,
        );
      } else {
        return FadeInImage(
          placeholder: const AssetImage(ImagesConstants.loading),
          image: ImageCustom.getImageProvider(_selectedAnimal!.url!),
          fadeInDuration: const Duration(milliseconds: 200),
          width: 100,
          fadeInCurve: Curves.easeIn,
        );
      }
    }

    return Scaffold(
      drawer: const DrawerCustom(),
      appBar: AppBar(
        title: const Text('Scannear Animal'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image != null
                ? PainelImage(path: image!.path)
                : const PainelBlank(),
            ButtonSendImage(
              onPressed: () async {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera_alt),
                              title: const Text('Câmera'),
                              onTap: () async {
                                final XFile? selectedImage =
                                    await _picker.pickImage(
                                  source: ImageSource.camera,
                                );
                                await saveImage(selectedImage);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Galeria'),
                              onTap: () async {
                                final XFile? selectedImage =
                                    await _picker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                await saveImage(selectedImage);
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            getImage(),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'Qual o tipo de animal que você acha que pode ser?',
                                softWrap: true,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Consumer<CategoryProviderImpl>(
                          builder: (context, provider, __) {
                            List<Category> list = provider.listCombo;
                            return DropdownButtonCustom<Category>(
                              loading: provider.loading,
                              label: 'Selecione uma categoria',
                              list: list
                                  .map((value) => DropdownMenuItem<Category>(
                                        value: value,
                                        child: Text(value.name ?? ''),
                                      ))
                                  .toList(),
                              onChanged: (Category? newValue) {
                                if (newValue != null) {
                                  animalProvider.findByCategoryScanner(
                                    newValue.id!,
                                  );
                                  setState(() {
                                    _selectedAnimal = null;
                                  });
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        ChangeNotifierProvider.value(
                          value: animalProvider,
                          builder: (context, __) {
                            List<Animal> animalsScanners =
                                animalProvider.animalsScanners;
                            return DropdownButtonCustom<Animal>(
                              label: 'Selecione um animal',
                              loading: animalProvider.loading,
                              list: animalsScanners.map((Animal value) {
                                return DropdownMenuItem<Animal>(
                                  value: value,
                                  child: Text(value.name ?? ''),
                                );
                              }).toList(),
                              value: _selectedAnimal,
                              onChanged: (Animal? newValue) {
                                setState(
                                  () {
                                    _selectedAnimal = newValue;
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: isValid(),
        child: FloatingActionButton(
          backgroundColor: ColorsConstants.defaultColor,
          onPressed: () {
            DialogCustom.dialogLoading(context);
            _sendOccurrence();
          },
          child: const Icon(Icons.send),
        ),
      ),
    );
  }
}
