import 'package:dw9delivery/app/core/ui/helpers/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(children: [
                SizedBox(height: context.percentHeight(.3)),
                Image.asset('assets/images/logo.png'),
                const SizedBox(height: 80),
                DeliveryButton(
                    width: context.percentWidth(.60),
                    height: 50,
                    label: 'ACESSAR',
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    })
              ]),
            )
          ],
        ),
      ),
    );
  }
}
