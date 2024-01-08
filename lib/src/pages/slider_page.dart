import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 200.0;
  bool _bloquearCheck = true;
  bool _bloquearSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _crearSlider(),
              _checkBox(),
              _crearSwitch(),
              Expanded(child: _crearImagen())
            ],
          ),
        ));
  }

  Widget _crearSlider() {
    return Slider(
        //activeColor: Colors.indigoAccent,
        value: _valorSlider,
        min: 0.0,
        max: 600.0,
        activeColor: Colors.purple,
        inactiveColor: Colors.purple.shade100,
        thumbColor: Colors.pink,
        divisions: 20,
        label: '${_valorSlider.round()}',
        onChanged: (_bloquearCheck)
            ? null
            : (v) {
                setState(() {
                  _valorSlider = v;
                });
              });
  }

  Widget _crearImagen() {
    return Image(
        image: NetworkImage(
            'data:image/jpeg;base64,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'),
        width: _valorSlider,
        fit: BoxFit.contain);
  }

  Widget _checkBox() {
    return CheckboxListTile(
        title: Text('Bloquear con checkbox'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor!;
          });
        }
    );
  }

 Widget _crearSwitch() {
   return SwitchListTile(
        title: Text('Bloquear con switch'),
        value: _bloquearCheck,
        
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
 }

}
