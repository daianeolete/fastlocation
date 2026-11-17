
import 'package:hive_flutter/hive_flutter.dart';

class AppStorage {
  static Future<void> initialize() async {
    await Hive.initFlutter();
  }
}
