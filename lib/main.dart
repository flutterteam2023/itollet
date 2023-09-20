import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/firebase_options.dart';
import 'package:itollet/iberkeugur/Log/log.dart';
import 'package:itollet/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.instance.success("Başarılı işlem");
  Log.instance.error("deneme");
  Log.instance.info("Bilgi data getirildi");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

final route = AppRouter();

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: route.config(),
            debugShowCheckedModeBanner: false,
            title: 'I-TOLLET',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(backgroundColor: Colors.white, elevation: 0, scrolledUnderElevation: 0),
              primaryColor: primary,
              colorScheme: ColorScheme.fromSeed(seedColor: primary, secondary: secondary),
              useMaterial3: true,
            ),
          );
        });
  }
}
