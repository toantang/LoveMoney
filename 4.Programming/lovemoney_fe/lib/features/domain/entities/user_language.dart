class UserLanguage {
  final String? _id;
  final String _code;
  final String? _name;
  final String? _description;

  UserLanguage({String? id, required String code, String? name, String? description})
      : _id = id,
        _code = code,
        _name = name,
        _description = description;

  UserLanguage copyWith({String? id, String? code, String? name, String? description}) {
    return UserLanguage(
      id: id ?? _id,
      code: code ?? _code,
      name: name ?? _name,
      description: description ?? _description,
    );
  }
}
