import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:testbank/provider/testbankprovider.dart';
import 'package:testbank/ui/splashpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  //flutter da hive veritabanını başlatmak için
  await Hive.initFlutter();
  GestureBinding.instance?.resamplingEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestBank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Avenir'),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => TestBankProvider(),
        ),
      ], child: SplashScreen()),
    );
  }
}
