import 'package:auto_route/auto_route.dart';
import 'package:itollet/features/Auth/Login/presentation/pages/login_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View|Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
       
        AutoRoute(page: LoginRoute.page,initial: true),
        




       
      ];
}