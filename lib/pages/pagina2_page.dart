import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

import 'package:estados/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){

              return snapshot.hasData
              ? Text('Nombre ${snapshot.data.nombre}')
              : Text('Pagina 2');
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue[200],
              onPressed: () {

                final nuevoUsuario = new Usuario(nombre: 'Carlos', edad: 21);  
                usuarioService.cargarUsuario(nuevoUsuario);
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue[200],
              onPressed: () {
                usuarioService.cambiarEdad(20);
              }
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue[200],
              onPressed: () {}
            )

          ],
        )
     ),
   );
  }
}