import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/firebase_options.dart';
import 'package:itollet/routing/app_router.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp( const ProviderScope(child: MyApp()));
}
final route = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child) {
        
        return MaterialApp.router(
          routerConfig: route.config(),
          debugShowCheckedModeBanner: false,
          title: 'I-TOLLET',
          theme: ThemeData(
            primaryColor: primary,
            
            colorScheme: ColorScheme.fromSeed(primary: primary,seedColor: primary,secondary: secondary),
            useMaterial3: true,
          ),
        );
      }
    );
  }
}

