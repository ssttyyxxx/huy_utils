import 'dart:async';

class OptimizeUtil {
  static throttleNoParam(Function func, int milliseconds) {
    bool enable = true;
    return () {
      if (enable == true) {
        enable = false;
        Future.delayed(Duration(milliseconds: milliseconds), () {
          enable = true;
          func();
        });
      }
    };
  }

  static throttle(Function func, int milliseconds) {
    bool enable = true;
    return (val) {
      if (enable == true) {
        enable = false;
        Future.delayed(Duration(milliseconds: milliseconds), () {
          enable = true;
          func(val);
        });
      }
    };
  }

  static multiThrottle(Function func, int milliseconds) {
    bool enable = true;
    return (val1, val2) {
      if (enable == true) {
        enable = false;
        Future.delayed(Duration(milliseconds: milliseconds), () {
          enable = true;
          func(val1, val2);
        });
      }
    };
  }

  static debounce(
      Function func, [
        Duration delay = const Duration(milliseconds: 100),
      ]) {
    Timer? timer;
    return (val) {
      if (timer != null) {
        timer?.cancel();
      }

      timer = Timer(delay, () {
        func(val);
      });
    };
  }
}