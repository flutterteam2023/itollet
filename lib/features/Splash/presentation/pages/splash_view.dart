import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/Login/presentation/pages/login_view.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';
import 'package:itollet/features/Categories/providers/category_notifier.dart';
import 'package:itollet/features/Home/presentation/pages/home_view.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';

@RoutePage()
class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final state = ref.watch(categoryProvider);  

    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
             if (snapshot.hasError) {
              return  Center(child: AutoSizeText('Something went wron connection',
              textScaleFactor: textScaleFactor,
              ));
            } else if (snapshot.hasData  ) {
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
                      return  Center(child: AutoSizeText('Something went wron connection',
                      textScaleFactor: textScaleFactor,
                      ));
                    } else if (futuresnapshot.hasData&&snapshot.data?.emailVerified==true) {
                      return StreamBuilder<List<PostModel>>(
                        stream: ref.watch(homeProvider.notifier).getStreamPosts(), 
                        builder:(context, postSnapshot) {
                          if (snapshot.hasError) {
                            print('Dataa gelmediii');
                            
                          }if (snapshot.hasData) {
                      return const HomeView();
                            
                          }
                          return LoginView();
                          
                        },);
                    } else {
                      return const LoginView();
                    }
                  });
            } else {
              return const HomeView();
            }
          }),
    );
  }
}
