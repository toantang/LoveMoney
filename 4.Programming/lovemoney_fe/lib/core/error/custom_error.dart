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


}