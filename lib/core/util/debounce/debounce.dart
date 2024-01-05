import 'dart:async';
import '../../common/app_constant.dart';

class DebounceUtil {
  var _debounce = Timer(const Duration(milliseconds: 0), () {});

  void run(Function callback, {Duration? duration}) {
    if (_debounce.isActive) {
      _debounce.cancel();
    }

    _debounce = Timer(duration ?? const Duration(seconds: AppConstant.debounceTimer), () => callback.call());
  }
}