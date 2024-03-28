/// Base class for every package with access of local memory
abstract class ILocalMemoryService {
  static const String themeModeStoreKey = 'themeMode';
  static const String languageStoreKey = 'language';
  static const String focusDurationStoreKey = 'focusDuration';
  static const String breakDurationStoreKey = 'breakDuration';

  Future<void> init();

  Future<void> storeString(String key, String value);
  Future<String?> loadString(String key);

  Future<void> storeInt(String key, int value);
  Future<int?> loadInt(String key);
}
