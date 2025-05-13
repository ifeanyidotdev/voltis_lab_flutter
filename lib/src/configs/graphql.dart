import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  static HttpLink httpLink = HttpLink(
    "https://graphql-auth-eta.vercel.app/api/v1/graphql/",
  );
  GraphQLClient clientToQuery({String? token}) {
    if (token != null && token.isNotEmpty) {
      final AuthLink authLink = AuthLink(getToken: () => 'Bearer $token');
      final Link link = authLink.concat(httpLink);
      return GraphQLClient(
        link: link,
        cache: GraphQLCache(),
        queryRequestTimeout: Duration(seconds: 15),
      );
    } else {
      return GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
        queryRequestTimeout: Duration(seconds: 15),
      );
    }
  }
}
