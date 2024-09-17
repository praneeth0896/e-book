import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taxi_app/base_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseRoute<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: getMediaQueryHeight(context, 0.06),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
