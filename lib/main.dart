import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_terricon/model_view/add_purposes_view_model.dart';
import 'package:hackaton_terricon/service/firebase_push_not/firebase_push_notification.dart';
import 'package:hackaton_terricon/view/about_book_view.dart';
import 'package:hackaton_terricon/view/sign_up_view.dart';
import 'package:hackaton_terricon/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PurposesViewModel()),
      ],
      child: const MyApp(),
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotification().initNotification();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(36, 36, 36, 1.0),
          appBarTheme:
              AppBarTheme(color: const Color.fromRGBO(36, 36, 36, 1.0))),
      // home: BottomNavigationBarWidget(),
      home: const SignUpView()
    );
  }
}
