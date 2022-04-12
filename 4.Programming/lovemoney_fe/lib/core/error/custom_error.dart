class CustomError {
  final String? code;
  final String? name;
  CustomError({this.code, this.name});


  CustomError copyWith({String? code, String? name}) {
    return CustomError(
      code: code,
      name: name ?? this.name,
    );
  }

  static bool validateCodeError(CustomError customError) {
    if (customError.code == ErrorCode.SUCCESS) {
      return true;
  }
    return false;
  }
}

class ErrorCode {
  static const String SUCCESS = 'Success';
  static const String FAILED = 'Failed';
}