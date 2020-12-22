import 'package:flutter/material.dart';
import 'package:listas/src/model/person.model.dart';

// Ctrl + . into StatelessWidget

class FormText extends StatefulWidget {
  @override
  _FormTextState createState() => _FormTextState();
}

class _FormTextState extends State<FormText> {
  String cajaTexto = "";
  String dropdownValue = 'lista1';

  PersonModel persons = new PersonModel();

  visualizar(data) {
    print(data);
  }

  List _lstItem = ["lista1", "lista2", "lista"];

  @override
  Widget build(BuildContext context) {
    /**
     * VARIABLES LOCALES
     */

    var sizedBox = SizedBox(
      height: 30.1,
    );
    var textFormField = TextFormField(
      cursorColor: Theme.of(context).cursorColor,
      initialValue: 'Input text',
      maxLength: 20,
      onChanged: (value) {
        setState(() {
          cajaTexto = value;
          persons.nombre = value;
        });
      },
      decoration: InputDecoration(
        icon: Icon(Icons.view_agenda),
        labelText: 'Label text',
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        helperText: 'Helper text',
        suffixIcon: Icon(
          Icons.check_circle,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),
    );
    var textFormField2 = TextFormField(
      initialValue: persons.numero,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          persons.numero = value;
        });
      },
      decoration: InputDecoration(
        icon: Icon(Icons.contact_phone),
        labelText: 'Digit Number',
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        suffixIcon: Icon(
          Icons.check_circle,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
    var textFormField3 = TextFormField(
      keyboardType: TextInputType.emailAddress,
      initialValue: persons.email,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Digit Email',
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        helperText: 'Digit Email',
        suffixIcon: Icon(
          Icons.check_circle,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
    var textFormField4 = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      initialValue: persons.password,
      decoration: InputDecoration(
        icon: Icon(Icons.security),
        labelText: 'Digit Password',
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        helperText: 'Digit Password',
        suffixIcon: Icon(
          Icons.check_circle,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
    var column = Column(
      children: [
        ListTile(
          title: Text("$cajaTexto"),
        ),
        ListTile(
          title: Text(persons.numero),
        )
      ],
    );
    var flatButton = FlatButton(
      onPressed: () {
        //visualizar(persons);
        print(persons.toJson().toString());
      },
      child: Text('Ingreso'),
      color: Colors.blue[100],
    );
    var dropdownButton = DropdownButton(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 6,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        isExpanded: true,
        hint: new Text("Select option"),
        items: _lstItem.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          //print(value);
          setState(() {
            dropdownValue = value;
          });
        });

    /**
     * DISEÑO APP
     */
    return Scaffold(
        appBar: AppBar(
          title: Text('Form App'),
        ),
        body: ListView(
          padding: EdgeInsets.all(15.0),
          children: [
            textFormField,
            sizedBox,
            textFormField2,
            sizedBox,
            textFormField3,
            sizedBox,
            textFormField4,
            sizedBox,
            dropdownButton,
            column,
            flatButton,
          ],
        ));
  }
}
