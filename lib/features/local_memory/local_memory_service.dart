abstract class LocalMemoryService {
  static const String themeModeStoreKey = 'themeMode';

  Future<void> init();

  Future<void> storeString(String key, String value);
  Future<String?> loadString(String key);
}
