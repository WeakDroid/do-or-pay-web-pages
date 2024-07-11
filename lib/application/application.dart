import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../presentation/screens/do_or_pay_landing_main_screen.dart';
import '../presentation/screens/support_screen.dart';

class DoOrPayWebApp extends StatelessWidget {
  const DoOrPayWebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SupportScreen(),
    );
  }
}
