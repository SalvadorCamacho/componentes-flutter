import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Page'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            _cardTipo1(),
            const SizedBox(height:30.0),
            _cardTipo2(),
            const SizedBox(height:30.0),
            _cardTipo2(),
            const SizedBox(height:30.0),
            _cardTipo2(),
            const SizedBox(height:30.0),
            _cardTipo2(),

            ],
        ));
  }

  Widget _cardTipo1() {
    final card = Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
        child: Column(
      children: [
        const ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('aquí poner título'),
          subtitle: Text('soy el subtítulo'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(onPressed: () {}, child: const Text('Cancelar')),
            TextButton(onPressed: () {}, child: const Text('Ok'))
          ],
        )
      ],
    )
  );
     return Container(
      child: card,
     );
  }

  Widget _cardTipo2() {
    final card = Column(
    children: <Widget>[
      const FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage('https://img.freepik.com/free-photo/abstract-grunge-decorative-relief-navy-blue-stucco-wall-texture-wide-angle-rough-colored-background_1258-28311.jpg?w=1060&t=st=1681923255~exp=1681923855~hmac=01374ec7557ddee3c21b214ea7a7e92d7129303e45333b871d107957b7baef1d'),
        fadeInDuration: Duration(milliseconds: 200),
        height: 300.0,
        fit: BoxFit.cover,
      ),
      Container(
        padding: const EdgeInsets.all(10.0),
        child: const Text("Aquí va la descripción de la img"
        , style: TextStyle(color:Colors.white,
          fontWeight: FontWeight.bold)),
      )
    ],
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.redAccent,
          boxShadow: const <BoxShadow>[
            BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)

            )
          ]
          ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card
      )
    );

  }
}
