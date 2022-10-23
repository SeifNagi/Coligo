class LanguageModel {
  String? name;
  String? code;
  LanguageModel({required this.code, required this.name});
  Map<String, dynamic> toJson() => {'code': code, 'name': name};
}
