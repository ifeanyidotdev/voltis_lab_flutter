import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  static const String endpoint = 'https://your-graphql-endpoint.com/graphql';

  static HttpLink httpLink = HttpLink(
    endpoint,
    defaultHeaders: {"Cache-Control": "no-cache", "Pragma": "no-cache"},
  );
  Future<GraphQLClient> clientToQuery({String? token}) async {
    if (token != null && token.isNotEmpty) {
      final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
      final Link link = authLink.concat(httpLink);
      return GraphQLClient(
        link: link,
        cache: GraphQLCache(),
        queryRequestTimeout: Duration(seconds: 15),
      );
    } else {
      return GraphQLClient(link: httpLink, cache: GraphQLCache());
    }
  }
}
