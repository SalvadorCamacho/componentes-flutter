import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () => _mostrarAlert(context),
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          //textStyle: TextStyle(color: Colors.blue) // foreground
        ),
        child: const Text('Mostrar alerta'),
      )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_location),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            title: const Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('Esto es un mensaje'),
                FlutterLogo(size: 50.0,)
              ],
            ),
            actions: <Widget>[
               TextButton(
                 child: const Text('cancelar'),
                 onPressed: ()  => Navigator.of(context).pop(),
               ),
               TextButton(
                 child: const Text('OK'),
                 onPressed: ()  => Navigator.of(context).pop(),
               )
            ],
          );
        });
  }
}
