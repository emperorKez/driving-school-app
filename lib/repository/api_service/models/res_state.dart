import 'package:korbil_mobile/repository/api_service/models/data_state.dart';

abstract class ResponseState<T> {
  const ResponseState({this.data, this.error});

  final T? data;
  final DataError? error;
}

class ResponseSuccess<T> extends ResponseState<T> {
  const ResponseSuccess(T data) : super(data: data);
}

class ResponseFailed<T> extends ResponseState<T> {
  const ResponseFailed(DataError error) : super(error: error);
}
