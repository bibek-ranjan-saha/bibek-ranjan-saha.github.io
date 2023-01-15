import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Api{
  final Dio _httpClient = Dio();
  Dio get client => _httpClient;

  static Api? _instance;

  IO.Socket? socket;

  String uri = 'https://bibek-saha.onrender.com/';

  Api._internal() {
    socket = IO.io(uri, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false
    });
    socket?.connect();
  }

  static Api get instance {
    _instance ??= Api._internal();
    return _instance!;
  }
}