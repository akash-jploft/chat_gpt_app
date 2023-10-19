import 'package:flutter/material.dart';
import 'package:nabgh_app/pages/splash_screen/feature_showcase_papge.dart';
import 'package:nabgh_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff111111),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
      home: FeatureShowCasePage(),
    );
  }
}
