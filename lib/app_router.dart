import 'package:go_router/go_router.dart';
import 'package:other_widget/sliver_app_bar.dart';
import 'package:other_widget/wep_view.dart';

abstract class AppRouter {
  static const kwebView = '/webView';
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SliverAppBarPage(),
      ),
      GoRoute(
        path: kwebView,
        builder: (context, state) => const WepViewPage(),
      ),
    ],
  );
}
