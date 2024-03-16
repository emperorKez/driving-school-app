class ApiRes<T> {
  ApiRes({
    required this.code,
    required this.status,
    required this.response,
  });

  int code;
  String status;
  T response;
}
