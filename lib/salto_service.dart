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
      String command = "\x02CNMB|+66867866564|101|\x03";
      socket.writeln(command);
      print("socket.write : ${command}");
      // Listen for incoming data
      socket.listen(
        (data) {
          print("raw data : ${data}");
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
