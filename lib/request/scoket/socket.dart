import 'dart:io';
import 'dart:async';

class Scoket {
  late Socket _socket;

  // 链接Socket
  Future<void> connect(String host, int port) async {
    _socket = await Socket.connect(host, port);
    print("Connect");
  }

  Future<void> send(String msg) async {
    _socket.write(msg);
  }

  Future<String> receive() async {
    final completer = Completer<String>();
    _socket.listen((data) {
      completer.complete(String.fromCharCodes(data).trim());
    });
    return completer.future;
  }

  Future<void> close() async {
    await _socket.close();
    print('Socket closed');
  }
}
