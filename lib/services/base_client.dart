import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Api {
  final Dio _httpClient = Dio();

  // Dio get client => _httpClient;

  static Api? _instance;

  IO.Socket? socket;

  String uri = 'https://bibek-saha.onrender.com/';

  Api._internal() {
    socket = IO.io(uri, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true
    });
    socket?.connect();
  }

  static Api get instance {
    _instance ??= Api._internal();
    return _instance!;
  }

  getData(String url, {bool needHeader = false}) async {
    Response response = await _httpClient.get(
      url,
      options: !needHeader
          ? null
          : Options(headers: {
              "Access-Control-Allow-Origin": "*",
              'Content-Type': 'application/json',
              'Accept': '*/*'
            }),
    );
    return response;
  }

  postData(String url,
      {required Map<String, dynamic> data, bool needHeader = false}) async {
    Response response = await _httpClient.post(url,
        options: !needHeader
            ? null
            : Options(headers: {
                "Access-Control-Allow-Origin": "*",
                'Content-Type': 'application/json',
                'Accept': '*/*'
              }),
        data: data);
    return response;
  }
}
