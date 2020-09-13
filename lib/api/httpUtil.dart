import 'package:http/http.dart' as http;

class HttpUtil {
  String token = "af7c7d106b40daa14e04dc975e3d2249";

  post({url, params}) async {
    return await http.post(url, body: params, headers: {"token": token});
  }
}
