import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/firebase_options.dart';
import 'package:itollet/routing/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.currentUser?.getIdToken().then((token) {
    print(token);
  });
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
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                scrolledUnderElevation: 0,
              ),
              scaffoldBackgroundColor: Colors.white,
              primaryColor: primary,
              inputDecorationTheme: InputDecorationTheme(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(999),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: secondary, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(999),
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(999),
                  ),
                ),
              ),
              colorScheme: ColorScheme.fromSeed(
                  seedColor: primary, secondary: secondary),
              useMaterial3: true,
            ),
          );
        });
  }
}
