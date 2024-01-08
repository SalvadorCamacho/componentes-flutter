import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  TextEditingController _controlFecha = TextEditingController();

  List<String> _poderes = [
    'volar',
    'Rayos x',
    'Super aliento',
    'Super fuerza',
  ];

  String _opcionSeleccionada = 'volar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs de texto'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearDropDown(context),
            Divider(),
            _crearPersona(),
            _mostrarPassword(),
          ],
        ));
  }

  _crearInput() {
    return TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('Letras ${_nombre.length}'),
            hintText: 'Escribe tu nombre',
            labelText: 'Nombre',
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.account_circle)),
        onChanged: (valor) {
          setState(() {
            _nombre = valor;
          });
          //print(_nombre);
        });
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }

  _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('Letras ${_email.length}'),
            hintText: 'Email',
            labelText: 'Escribe tu correo electrónico',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('Letras ${_password.length}'),
            hintText: 'Password',
            labelText: 'Escribe una contraseña',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock)),
        onChanged: (valor) => setState(() {
              _password = valor;
            }));
  }

  Widget _mostrarPassword() {
    return ListTile(
      title: Text('El passwodord es: $_password'),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
        controller: _controlFecha,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Fecha de nacimiento',
            labelText: 'Escribe la fecha de nacimiento',
            suffixIcon: Icon(Icons.perm_contact_calendar),
            icon: Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        });
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2050),
        locale: Locale("es", "ES"));
    if (picked != null) {
      setState(() {
        _fecha = DateFormat.d().format(picked) +
            "/" +
            DateFormat.M().format(picked) +
            "/" +
            DateFormat.y().format(picked);
        // _fecha = DateFormat.yMd().format(picked);
        _controlFecha.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdonw() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropDown(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
         child:DropdownButton(
           value: _opcionSeleccionada,
           items: getOpcionesDropdonw(),
           onChanged: (opt) {
             setState(() {
             _opcionSeleccionada = opt.toString();
           });
        })
        )
      ],
    );


  }
}
