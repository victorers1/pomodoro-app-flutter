import 'package:pomodoro/features/local_memory/i_local_memory_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends ILocalMemoryService {
  final SharedPreferences _prefs;

  SharedPreferenceService({required SharedPreferences prefs}) : _prefs = prefs;

  @override
  Future<void> init() async {
    throw UnimplementedError();
  }

  @override
  Future<void> storeString(String key, String value) async {
    _prefs.setString(key, value);
  }

  @override
  Future<String?> loadString(String key) async => _prefs.getString(key);
}
