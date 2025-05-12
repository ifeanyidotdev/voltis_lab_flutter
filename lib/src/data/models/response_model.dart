class Result<T> {
  T? response;
  Result({this.response});
}

class ResponseSuccess<T> {
  String? message;
  bool? success;
  T? data;

  ResponseSuccess({this.data, this.message, this.success});

  factory ResponseSuccess.fromJson(
    Map<String, dynamic> data,
    T Function(Map<String, dynamic> jsonData) fromJsonT,
    String value,
  ) {
    return ResponseSuccess(
      data: data[value] != null ? fromJsonT(data[value]) : null,
      success: data['success'],
      message: data['message'],
    );
  }
}

class ResponseError {
  String? message;
  bool? success;
  List<dynamic>? errors;

  ResponseError({this.errors, this.message, this.success});

  factory ResponseError.fromJson(Map<String, dynamic> data) {
    return ResponseError(
      errors: data['errors'],
      success: data['success'],
      message: data['message'],
    );
  }
}
