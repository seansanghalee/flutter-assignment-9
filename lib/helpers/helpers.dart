class Helpers {
  static int convertMinToSec({required int minutes}) {
    return minutes * 60;
  }

  static String getMinutes({required int seconds}) {
    return Duration(seconds: seconds).toString().split(".").first.split(":")[1];
  }

  static String getSeconds({required int seconds}) {
    return Duration(seconds: seconds)
        .toString()
        .split(".")
        .first
        .split(":")
        .last;
  }
}
