import 'dart:io';

class ServiceSalto {
  Future<void> initializeSalto() async {
    try {
      // Socket socket = await Socket.connect('0.0.0.0', 8888);
      Socket socket = await Socket.connect('192.168.1.49', 8888,
          timeout: const Duration(seconds: 5));
      // Socket socket = await Socket.connect('10.0.0.2', 8888);
      print(
          'Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

      // Send data
      socket.writeln('\x02CNMB|+66867866564|101\x03');
      print("socket.write : \x02CNMB|+66867866564|101\x03");
      // Listen for incoming data
      socket.listen(
        (data) {
          String s = new String.fromCharCodes(data);
          print("data : ${data}");
          print('Received: ${String.fromCharCodes(data)}');
        },
        onDone: () {
          print('Connection closed');
          socket.destroy();
        },
        onError: (error) {
          print('Error: $error');
        },
      );
    } catch (e) {
      print('Unable to connect: $e');
    }
  }
}
