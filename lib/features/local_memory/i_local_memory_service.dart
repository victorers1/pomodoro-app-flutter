/// Base class for every package with access of local memory
abstract class ILocalMemoryService {
  static const String themeModeStoreKey = 'themeMode';
  static const String languageStoreKey = 'language';

  Future<void> init();

  Future<void> storeString(String key, String value);
  Future<String?> loadString(String key);
}
