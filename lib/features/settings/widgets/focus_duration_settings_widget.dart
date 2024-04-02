import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/extensions/string_extensions.dart';
import 'package:pomodoro/features/settings/widgets/integers_scroll_picker_widget.dart';
import 'package:pomodoro/theme/durations.dart';
import 'package:pomodoro/theme/sizes.dart';

class FocusDurationSettingWidget extends StatefulWidget {
  const FocusDurationSettingWidget({
    super.key,
    this.onChanged,
    required this.focusDuration,
  });

  final Duration focusDuration;

  final void Function(int?)? onChanged;

  @override
  State<FocusDurationSettingWidget> createState() =>
      _FocusDurationSettingWidgetState();
}

class _FocusDurationSettingWidgetState extends State<FocusDurationSettingWidget>
    with SingleTickerProviderStateMixin {
  final optionsScrollController = ScrollController();

  @override
  void dispose() {
    optionsScrollController.dispose();
    super.dispose();
  }

  bool get listTileIsShowingValue => optionsScrollController.hasClients
      ? optionsScrollController.offset ==
          optionsScrollController.initialScrollOffset
      : true;

  toggleState() {
    if (listTileIsShowingValue) {
      animateTrailingWidgetToOptions();
    } else {
      animateTrailingWidgetToSelectedValue();
    }
  }

  void animateTrailingWidgetToSelectedValue() {
    optionsScrollController.animateTo(
      0,
      duration: PomodoroDurations.animation,
      curve: Curves.linear,
    );
  }

  void animateTrailingWidgetToOptions() {
    optionsScrollController.animateTo(
      optionsScrollController.position.maxScrollExtent,
      duration: PomodoroDurations.animation,
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    final optionsWidth = MediaQuery.of(context).size.width / 2.1;

    return GestureDetector(
      onTap: toggleState,
      child: ListTile(
        title:
            Text('${AppLocalizations.of(context)?.focusDuration.capitalize}'),
        trailing: SizedBox(
          width: optionsWidth,
          height: Sizes.size64,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            controller: optionsScrollController,
            children: [
              SizedBox(
                width: optionsWidth,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${widget.focusDuration.inMinutes} ${AppLocalizations.of(context)?.minutesAbbrev}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              const SizedBox(width: Sizes.size32),
              SizedBox(
                width: optionsWidth,
                child: IntegerScrollPickerWidget(
                  options: const [10, 15, 20, 25, 30],
                  onPicked: (value) {
                    toggleState();
                    widget.onChanged?.call(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
