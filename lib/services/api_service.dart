import 'package:http/http.dart' as http;

class ApiService {
  Map<String, String>? header = {
    'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com',
    'X-RapidAPI-Key': 'de77f72187msha8a0f20e6868b22p139d76jsn940c30c85f35'
  };
  Future getApi(String url) async {
    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    return response;
  }

  Future postApi(String url, Map body) async {
    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );
    return response;
  }
}
