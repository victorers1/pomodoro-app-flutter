extension IntExt on int {
  String get padLeft {
    if (this > 0) {
      return this > 9 ? '$this' : '0$this';
    } else if (this < 0) {
      return this > -10 ? '-0${abs()}' : '$this';
    } else {
      return '00';
    }
  }
}
