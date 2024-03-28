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
    await _prefs.setString(key, value);
  }

  @override
  Future<String?> loadString(String key) async => _prefs.getString(key);

  @override
  Future<void> storeInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  @override
  Future<int?> loadInt(String key) async => _prefs.getInt(key);
}
