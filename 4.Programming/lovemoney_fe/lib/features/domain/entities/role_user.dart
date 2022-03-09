class RoleUser {
  final String? _type;
  final String? _name;

  RoleUser({String? type, String? name}) : _type = type, _name = name;

  RoleUser copyWith({String? type, String? name}) {
    return RoleUser(
      type: type ?? _type,
      name: name ?? _name,
    );
  }
}