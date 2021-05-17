import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/bloc/usuario/usuario_bloc.dart';

class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Scaffold(
      appBar: AppBar(  
        title: Text('Pagina 1'),
        centerTitle: true,
        actions: [

          IconButton(
            icon: Icon(Icons.delete), 
            onPressed: () => usuarioBloc.add(BorrarUsuario())
          ),

        ],
      ),

      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: ( _ , state) {

          if( state.existeUsuario ){
            return _InformacionUsuario(state.usuario);
          } else {
            return Center(child: Text('No hay un usuario seleccionado'));
          }

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

          ...this.usuario.profesiones.map(
            (profesion) => ListTile( title: Text(profesion))
          ).toList()
          
        ]
       ),
    );
  }
}