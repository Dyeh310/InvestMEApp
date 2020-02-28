import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    ///check status codes
    if (response.statusCode == 200) {
      String data = response.body;

      ///search endpoint api
      ///
      /// The Search Endpoint returns the best-matching symbols and market information
      /// based on keywords of the user's choice. The search results also contain
      /// match scores that provide you with the full flexibility.
      /// @param function, (symbol_search), keywords

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
