String? validateName(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return "يرجى إدخال $fieldName";
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || !value.contains("@")) {
    return "يرجى إدخال بريد إلكتروني صالح";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.length < 6) {
    return "يجب أن تكون كلمة المرور 6 أحرف على الأقل";
  }
  return null;
}

String? validateConfirmPassword(String? value, String confirmPassword) {
  if (value != confirmPassword) {
    return "كلمتا المرور غير متطابقتين";
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return "يرجى إدخال رقم الهاتف";
  }
  return null;
}

String? validateAge(String? value) {
  if (value == null || int.tryParse(value) == null) {
    return "يرجى إدخال العمر بشكل صحيح";
  }
  return null;
}
