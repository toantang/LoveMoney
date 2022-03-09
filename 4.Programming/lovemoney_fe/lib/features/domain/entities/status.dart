class Status {
  final String code;
  final String? name;

  Status({required this.code, this.name});

  Status copyWith({String? code, String? name}) {
    return Status(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }
}