class Validator {
  String? required(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  String? matchExact(String? value, String? value2, String message) {
    if (value != value2) {
      return message;
    }
    return null;
  }
}
