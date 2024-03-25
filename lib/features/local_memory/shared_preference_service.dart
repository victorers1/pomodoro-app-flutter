import 'package:pomodoro/features/local_memory/local_memory_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends LocalMemoryService {
  final SharedPreferences prefs;

  SharedPreferenceService({required this.prefs});

  @override
  Future<void> init() async {
    throw UnimplementedError();
  }

  @override
  Future<void> storeString(String key, String value) async {
    prefs.setString(key, value);
  }

  @override
  Future<String?> loadString(String key) async => prefs.getString(key);
}
