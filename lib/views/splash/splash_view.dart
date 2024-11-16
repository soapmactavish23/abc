import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/main_package/routes/routes_name.dart';
import 'package:radar_peconhento_mobile/main_package/theme/constants.dart';
import 'package:radar_peconhento_mobile/views/splash/components/permission_location.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double _scale = 4.0;
  double _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 350 * _scale;
  double get _logoAnimationHeight => 350 * _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _animationOpacityLogo,
          duration: const Duration(seconds: 3),
          onEnd: () {},
          child: AnimatedContainer(
            duration: const Duration(seconds: 3),
            width: _logoAnimationWidth,
            height: _logoAnimationHeight,
            curve: Curves.linearToEaseOut,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  ImagesConstants.imageLogo,
                ),
              ],
            ),
            onEnd: () {
              PermissionLocation.getPermission().then((value) {
                Navigator.pushReplacementNamed(
                  context,
                  RoutesName.baseRoute,
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
