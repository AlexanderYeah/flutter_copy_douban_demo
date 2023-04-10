import 'http_request.dart';

main(List<String> args) {
  HTTPRequest.request("/api/qq/vip", params: {"qq": "1023954998"})
      .then((value) {
    print(value);
  });
}
