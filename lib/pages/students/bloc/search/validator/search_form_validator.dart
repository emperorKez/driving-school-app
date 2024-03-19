class KeywordValidator {
  KeywordValidator({
    this.keyword,
  });
  final String? keyword;

  bool validateKeyword() {
    return keyword!.length > 3 || false;
  }
}
