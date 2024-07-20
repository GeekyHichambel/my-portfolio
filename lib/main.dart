import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/HomePage.dart';
import 'package:my_portfolio/providers/config.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Config()),
    ],
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          title: 'My Portfolio',
          debugShowCheckedModeBanner: false,
          routes: {
            '/homePage' : (context) => const HomePage(),
          },
          home: const HomePage(),
        );  
}
}

