import 'package:flutter/material.dart';
import 'package:pomodoro/theme/sizes.dart';

class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size32),
        child: Center(
          child: Text(
            // TODO: intl
            'Sorry, nothing to see here.',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
