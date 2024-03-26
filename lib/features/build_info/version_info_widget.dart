import 'package:flutter/material.dart';

class VersionInfoWidget extends StatelessWidget {
  const VersionInfoWidget({
    super.key,
    required this.buildInfo,
  });

  final Future<List<String>> buildInfo;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: buildInfo,
      initialData: const ['0.0.0', '0'],
      builder: (context, snapshot) {
        String versionNumber = '';
        String buildNumber = '';
        [versionNumber, buildNumber] = snapshot.data ?? ['', ''];
        return Text('v$versionNumber+$buildNumber');
      },
    );
  }
}
