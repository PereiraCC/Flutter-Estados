import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_bloc.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Scaffold(
      appBar: AppBar(  
        title: Text('Pagina 2'),
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

                final newUser = new Usuario(
                  nombre: 'Carlos Pereira',
                  edad: 21,
                  profesiones: ['Fullstack Developer']
                );
                
                usuarioBloc.add(ActivarUsuario(newUser));

              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue[200],
              onPressed: () => usuarioBloc.add(CambiarEdad(20)),
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue[200],
              onPressed: () => usuarioBloc.add(AgregarProfesion('Nueva Profesion')),
              
            )

          ],
        )
     ),
   );
  }
}