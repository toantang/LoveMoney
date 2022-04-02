import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable()
class Status {
  final String code;
  final String? name;

  Status({required this.code, this.name});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  Status copyWith({String? code, String? name}) {
    return Status(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'Status{code: $code, name: $name}';
  }
}

class CodeStatus {
  static const String UNFI = 'unfi';
  static const String FI = "fi";
}

class NameStatus {
  static const String UNFINISHED = 'unfinished';
  static const String FINISHED = 'finished';
}

