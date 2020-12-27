import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultimediaPage extends StatefulWidget {
  MultimediaPage({Key key}) : super(key: key);

  @override
  _MultimediaPageState createState() => _MultimediaPageState();
}

class _MultimediaPageState extends State<MultimediaPage> {
  @override
  Widget build(BuildContext context) {
    void _entrarCamara(ImageSource origen) async {
      final _foto = ImagePicker();

      final file = await _foto.getImage(source: origen);

      print(file);
    }

    void _entrarGaleria(ImageSource origen) {}

    var sizedBox = SizedBox(
      height: 30,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("MultimediaPage"),
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Text("Cargar MultimediaPage"),
              ),
              sizedBox,
              RaisedButton.icon(
                onPressed: () {
                  _entrarCamara(ImageSource.camera);
                },
                icon: Icon(Icons.image),
                label: Text("Tomar Foto"),
              ),
              RaisedButton.icon(
                onPressed: () {
                  _entrarCamara(ImageSource.gallery);
                },
                icon: Icon(Icons.camera),
                label: Text("Abrir galeria"),
              ),
              sizedBox
            ],
          )),
    );
  }
}
