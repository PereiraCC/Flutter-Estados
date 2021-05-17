import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';

import 'package:estados/bloc/usuario/usuario_cubit.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context);

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
                  nombre: 'Carlos',
                  edad: 21,
                  profesiones: [
                    'FullStack Developer',
                    'Videojugador Veterano'
                  ]
                );
                
                usuarioCubit.seleccionarUsuario(newUser);

              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue[200],
              onPressed: () =>  usuarioCubit.cambiarEdad(20),
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue[200],
              onPressed: () => usuarioCubit.agregarProfesion(),
            )

          ],
        )
     ),
   );
  }
}