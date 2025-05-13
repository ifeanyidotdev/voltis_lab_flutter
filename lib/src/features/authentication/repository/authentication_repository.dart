import 'dart:developer';

import 'package:flutter_test_voltis/src/configs/graphql.dart';
import 'package:flutter_test_voltis/src/data/models/response_model.dart';
import 'package:flutter_test_voltis/src/features/authentication/models/login_model.dart';
import 'package:flutter_test_voltis/src/features/authentication/models/register_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class AuthenticationRepository {
  Future<Result<dynamic>> login({
    required String email,
    required String password,
  });
  Future<Result<dynamic>> register({
    String? displayName,
    required String email,
    required String username,
    required String firstName,
    required String lastName,
    required String password1,
    required String password2,
  });
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final GraphQlConfig _graphQlConfig = GraphQlConfig();
  String? _authToken;

  String? get authToken => _authToken;
  AuthenticationRepositoryImpl();

  @override
  Future<Result<dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      GraphQLClient client = _graphQlConfig.clientToQuery();
      const String request = r"""
          mutation Login($password:String!, $email:String!){
            login(password:$password,email:$email) {
              user{
                id
                email
                username
                firstName
                lastName
                verified
                isActive
              }
              token
              refreshToken
              use2fa
              success
              refreshExpiresIn
              errors
            }
          }
          """;

      QueryResult result = await client.mutate(
        MutationOptions(
          document: gql(request),
          fetchPolicy: FetchPolicy.noCache,
          variables: {"email": email, "password": password},
        ),
      );
      if (result.hasException) {
        log("EXCEPTION: ${result.exception.toString()}");
        return Result(
          response: ResponseError(
            message: result.exception?.graphqlErrors.first.message,
            errors: result.exception?.graphqlErrors,
          ),
        );
      }
      log("DATA_RECEIVED: ${result.data}");
      // _authToken = data['token'];
      return Result(
        response: ResponseSuccess<LoginModel>.fromJson(
          result.data!,
          (data) => LoginModel.fromJson(data),
          "login",
        ),
      );
    } catch (e) {
      print(e.toString());
      return Result(response: ResponseError(message: e.toString()));
    }
  }

  @override
  Future<Result<dynamic>> register({
    String? displayName,
    required String email,
    required String username,
    required String firstName,
    required String lastName,
    required String password1,
    required String password2,
  }) async {
    try {
      GraphQLClient client = _graphQlConfig.clientToQuery();
      const String request = r'''
      mutation RegisterUser(
        $displayName: String
        $email: String!
        $username: String!
        $firstName: String!
        $lastName: String!
        $password1: String!
        $password2: String!
      ) {
        register(
          displayName: $displayName
          email: $email
          username: $username
          firstName: $firstName
          lastName: $lastName
          password1: $password1
          password2: $password2
        ) {
          refreshToken
          token
          success
          errors
        }
      }
    ''';
      QueryResult result = await client.mutate(
        MutationOptions(
          document: gql(request),
          fetchPolicy: FetchPolicy.noCache,
          variables: {
            "displayName": username,
            "email": email,
            "username": username,
            "firstName": firstName,
            "lastName": lastName,
            "password1": password1,
            "password2": password2,
          },
        ),
      );

      if (result.hasException) {
        log("EXCEPTION: ${result.exception.toString()}");
        return Result(
          response: ResponseError(
            message: result.exception?.graphqlErrors.first.message,
            // errors: result.exception?.graphqlErrors,
          ),
        );
      }
      log("DATA_RECEIVED: ${result.data}");
      final data = result.data!['register'];
      if (data['success'] == false) {
        final errors = data?['errors'] as Map<String, dynamic>?;
        // Collect all error messages into one string
        final errorMessages =
            errors?.entries.map((entry) => '${entry.value.join(", ")}').first;
        // .join("\n");
        return Result(
          response: ResponseError(
            message: errorMessages ?? "Registration failed",
            success: false,
          ),
        );
      } else {
        // _authToken = data['token']; // optional if you store token
        return Result(
          response: ResponseSuccess<RegisterModel>.fromJson(
            result.data!,
            (data) => RegisterModel.fromJson(data),
            "register",
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      return Result(response: ResponseError(message: e.toString()));
    }
  }
}
