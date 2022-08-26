import 'dart:async';

import 'package:ecommerce_app/common/routes/app_routes.dart';
import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:ecommerce_app/di.dart' as di;
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        opacity = 1.0;
      });
    });

    di.init();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutesName.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: opacity,
        child: Container(
          decoration: const BoxDecoration(color: AppColors.blueBlack),
          child: Center(
              child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 132,
                height: 132,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.orange),
              ),
              Positioned(
                  top: 32,
                  left: 34,
                  child: Text(
                    'Ecommerce\nConcept ',
                    style: AppTextStyles.heavy.copyWith(color: Colors.white),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
