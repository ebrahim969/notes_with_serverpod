import 'package:notes_client/notes_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

abstract class MyClient
{
  static var client = Client('http://192.168.1.5:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();
}
