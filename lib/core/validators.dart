String? validateName(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return "يرجى إدخال $fieldName";
  }
  if (value.trim().length < 2) {
    return "$fieldName يجب أن يكون أكثر من حرفين";
  }
  return null;
}

String? validateEmail(String? value) {
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  if (value == null || value.trim().isEmpty) {
    return "يرجى إدخال البريد الإلكتروني";
  }
  if (!emailRegex.hasMatch(value.trim())) {
    return "يرجى إدخال بريد إلكتروني صالح";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "يرجى إدخال كلمة المرور";
  }
  if (value.length < 6) {
    return "يجب أن تكون كلمة المرور 6 أحرف على الأقل";
  }
  return null;
}

String? validateConfirmPassword(String? value, String originalPassword) {
  if (value == null || value.trim().isEmpty) {
    return "يرجى تأكيد كلمة المرور";
  }
  if (value != originalPassword) {
    return "كلمتا المرور غير متطابقتين";
  }
  return null;
}

String? validatePhone(String? value) {
  final phoneRegex = RegExp(r'^[0-9]{10,15}$');
  if (value == null || value.trim().isEmpty) {
    return "يرجى إدخال رقم الهاتف";
  }
  if (!phoneRegex.hasMatch(value.trim())) {
    return "يرجى إدخال رقم هاتف صالح (10-15 أرقام)";
  }
  return null;
}

String? validateNationality(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "يرجى إدخال الجنسية";
  }
  return null;
}

String? validateAddress(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return "يرجى إدخال $fieldName";
  }
  return null;
}

String? validateYearsOfExperience(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "يرجى إدخال عدد سنوات الخبرة";
  }
  if (int.tryParse(value) == null || int.parse(value) < 0) {
    return "يرجى إدخال عدد صحيح لسنوات الخبرة";
  }
  return null;
}

String? validateSessionDetails(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return "يرجى إدخال $fieldName";
  }
  if (double.tryParse(value) == null || double.parse(value) <= 0) {
    return "يرجى إدخال قيمة صحيحة لـ $fieldName";
  }
  return null;
}

String? validateUpload(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return "يرجى تحميل $fieldName";
  }
  return null;
}
