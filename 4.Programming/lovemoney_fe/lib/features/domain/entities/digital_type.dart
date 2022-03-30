import 'package:json_annotation/json_annotation.dart';

part 'digital_type.g.dart';

@JsonSerializable(explicitToJson: true,)
class DigitalType {
  String name;

  DigitalType({required this.name});

  DigitalType copyWith({String? name}) {
    return DigitalType(
      name: name ?? this.name,
    );
  }

  factory DigitalType.fromJson(Map<String, dynamic> json) =>
      _$DigitalTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DigitalTypeToJson(this);
}
