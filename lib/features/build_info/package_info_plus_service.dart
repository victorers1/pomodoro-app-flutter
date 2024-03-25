import 'package:package_info_plus/package_info_plus.dart';
import 'package:pomodoro/features/build_info/i_build_info_service.dart';

class PackageInfoPlusService extends IBuildInfoService {
  final PackageInfo _packageInfoPlus;

  PackageInfoPlusService({
    required PackageInfo packageInfoPlus,
  }) : _packageInfoPlus = packageInfoPlus;

  @override
  Future<String> getBuildNumber() async => _packageInfoPlus.buildNumber;

  @override
  Future<String> getVersionNumber() async => _packageInfoPlus.version;
}
