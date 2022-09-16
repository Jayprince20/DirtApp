import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiRequest {
  final String? url;
  final String? token;
  final Map<String, dynamic>? data;

  ApiRequest({
    @required this.url,
    this.token = "...",
    this.data,
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(BaseOptions(headers: {
      'Authorization': 'Bearer $token',
    }));
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio()
        .get(
      this.url!,
    )
        .then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void post({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio().post(this.url!, data: this.data!).then((res) {
      if (res.statusCode == 200 || res.statusCode == 201) {
        if (onSuccess != null) onSuccess(res.data);
      }
    }).catchError((error) {
      print(error);
      if (onError != null) onError(error);
    });
  }

  void put({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(DioError error)? onError,
  }) {
    _dio().put(this.url!, data: this.data!).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void delete({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(DioError error)? onError,
  }) {
    _dio().delete(this.url!, data: this.data!).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
