import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Text('Pagina 1'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){

            return snapshot.hasData
            ? _InformacionUsuario(snapshot.data)
            : Center(child: Text('No hay informacion del usuario'));
        },
      ),
     floatingActionButton: FloatingActionButton( 
       child: Icon(Icons.accessibility_new),
       onPressed: () => Navigator.pushNamed(context, 'pagina2'),
     ),
   );
  }
}

class _InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const _InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ListTile( title: Text('Nombre: ${this.usuario.nombre}')),
          ListTile( title: Text('Edad: ${this.usuario.edad}')),

          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ListTile( title: Text('Profesion 1')),
          ListTile( title: Text('Profesion 1')),
          ListTile( title: Text('Profesion 1')),
          
        ]
       ),
    );
  }
}