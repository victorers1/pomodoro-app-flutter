abstract class IBuildInfoService {
  Future<String> getVersionNumber();
  Future<String> getBuildNumber();
}
