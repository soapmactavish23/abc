// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/main_package/components/images/image_custom.dart';
import 'package:radar_peconhento_mobile/main_package/theme/constants.dart';

// ignore: must_be_immutable
class CardCustomImage extends StatelessWidget {
  String title;
  dynamic image;
  Widget? subtitle;
  Function()? onTap;
  Function()? onLongPress;

  CardCustomImage({
    Key? key,
    required this.title,
    required this.image,
    this.subtitle,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ListTile(
          leading: FadeInImage(
            placeholder: const AssetImage(ImagesConstants.loading),
            image: ImageCustom.getImageProvider(image),
            fadeInDuration: const Duration(milliseconds: 200),
            fadeInCurve: Curves.easeIn,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: ColorsConstants.defaultColor,
            ),
          ),
          subtitle: subtitle,
          onTap: onTap,
          onLongPress: onLongPress,
        ),
      ),
    );
  }
}
