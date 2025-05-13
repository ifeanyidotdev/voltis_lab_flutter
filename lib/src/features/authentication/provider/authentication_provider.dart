import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test_voltis/src/data/models/response_model.dart';
import 'package:flutter_test_voltis/src/features/authentication/models/login_model.dart';
import 'package:flutter_test_voltis/src/features/authentication/models/register_model.dart';
import 'package:flutter_test_voltis/src/features/authentication/repository/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {
  final AuthenticationRepository authRepository;
  final SharedPreferences store;
  AuthenticationProvider({required this.authRepository, required this.store});

  ResponseSuccess? successResponse;
  ResponseError? errorResponse;
  LoginModel? loginResponse;
  RegisterModel? registerResponse;

  bool _isLoading = false;
  bool _isError = false;
  bool _isSuccess = false;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(bool error) {
    _isError = error;
    notifyListeners();
  }

  void setSuccess(bool success) {
    _isSuccess = success;
    notifyListeners();
  }

  bool get isSuccess => _isSuccess;
  bool get isError => _isError;
  bool get isLoading => _isLoading;

  Future<void> signIn({required String email, required String password}) async {
    try {
      clear();
      setLoading(true);
      Result<dynamic> result = await authRepository.login(
        email: email,
        password: password,
      );
      if (result.response is ResponseError) {
        errorResponse = result.response as ResponseError;
        log("ERROR: ${errorResponse?.message.toString()}");
        setError(true);
        setLoading(false);
        notifyListeners();
        return;
      }
      successResponse = result.response as ResponseSuccess;
      loginResponse = successResponse!.data as LoginModel;
      await store.setString('token', loginResponse!.token!);
      await store.setString('refreshToken', loginResponse!.refreshToken!);
      setSuccess(true);
      setLoading(false);
      notifyListeners();
      return;
    } catch (error) {
      log("ERROR: ${error.toString()}");
      errorResponse = ResponseError(message: error.toString());
      setError(true);
      setLoading(false);
      notifyListeners();
    }
  }

  // handle registration
  Future<void> signUp({
    required String username,
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      clear();
      setLoading(true);
      Result<dynamic> result = await authRepository.register(
        email: email,
        displayName: username,
        username: username,
        firstName: firstname,
        lastName: lastname,
        password1: password,
        password2: confirmPassword,
      );
      if (result.response is ResponseError) {
        errorResponse = result.response as ResponseError;
        log("ERROR: ${errorResponse?.message.toString()}");
        setError(true);
        setLoading(false);
        notifyListeners();
        return;
      }
      successResponse = result.response as ResponseSuccess;
      registerResponse = successResponse!.data as RegisterModel;
      // await store.setString('token', registerResponse!.token!);
      // await store.setString('refreshToken', registerResponse!.refreshToken!);
      setSuccess(true);
      setLoading(false);
      notifyListeners();
      return;
    } catch (error) {
      log("ERROR: ${error.toString()}");
      errorResponse = ResponseError(message: error.toString());
      setError(true);
      setLoading(false);
      notifyListeners();
    }
  }

  void clear() {
    successResponse = null;
    errorResponse = null;
    loginResponse = null;
    registerResponse = null;
    _isLoading = false;
    _isError = false;
    _isSuccess = false;
  }
}
