class CustomValidation {
  static empty(String field, String value) {
    if (value.isEmpty) {
      return "$field tidak boleh kosong";
    }
    return null;
  }
}
