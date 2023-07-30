import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobilicis/firebase_options.dart';
import 'package:mobilicis/src/Service/ProductService.dart';
import 'package:mobilicis/src/Service/SearchService.dart';
import 'package:mobilicis/src/view/ProductPage1.dart';
import 'package:provider/provider.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ProductPageService>(create: (context)=>ProductPageService()),
      ChangeNotifierProvider<SearchService>(create: (context)=>SearchService()),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage1(),
    ),);

  }
}