
import 'package:material_ui/material_ui.dart';

import 'src/modules/initial/page/initial_page.dart';
import 'src/modules/home/page/home_page.dart';
import 'src/modules/history/page/history_page.dart';
import 'src/routes/app_routes.dart';
import 'src/shared/colors/app_colors.dart';
import 'src/shared/storage/app_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppStorage.initialize();

  runApp(const FastLocationApp());
}

class FastLocationApp extends StatelessWidget {
  const FastLocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: AppRoutes.initial,
      routes: {
        AppRoutes.initial: (context) => const InitialPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.history: (context) => const HistoryPage(),
      },
    );
  }
}
