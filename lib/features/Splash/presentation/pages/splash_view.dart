import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/Login/presentation/pages/login_view.dart';
import 'package:itollet/features/Categories/providers/category_notifier.dart';
import 'package:itollet/features/Home/presentation/pages/home_view.dart';

@RoutePage()
class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: secondary,
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wron connection'));
            } else if (snapshot.hasData) {
              return FutureBuilder(
                  future: ref.watch(categoryProvider.notifier).getCategories(),
                  builder: (context, futuresnapshot) {
                    if (futuresnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: secondary,
                        ),
                      );
                    } else if (futuresnapshot.hasError) {
                      return const Center(child: Text('Something went wron connection'));
                    } else if (futuresnapshot.hasData) {
                      return const HomeView();
                    } else {
                      return CircularProgressIndicator();
                    }
                  });
            } else {
              return const LoginView();
            }
          }),
    );
  }
}
