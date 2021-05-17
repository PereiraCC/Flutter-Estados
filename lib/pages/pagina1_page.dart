import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_cubit.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context);

    return Scaffold(
      appBar: AppBar(  
        title: Text('Pagina 1'),
        centerTitle: true,
        actions: [

          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: () => usuarioCubit.borrarUsuario(),
          ),

        ],
      ),
      body: _BodyScaffold(),
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
   );
  }
}

class _BodyScaffold extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: ( _ , state) { 

        switch (state.runtimeType) {

          case UsuarioInitial:
            return Center(child: Text('No hay informacion del usuario'));
            break;

          case UsuarioActivo:
            return _InformacionUsuario((state as UsuarioActivo).usuario);
          break;

          default: 
            return Center(child: Text('Estado no reconocido'));
        }
        
        // if(state is UsuarioInitial) {
        //   return Center(child: Text('No hay informacion del usuario'));
        // } else if( state is UsuarioActivo) {
        //   return _InformacionUsuario(state.usuario);
        // } else {
        //   return Center(child: Text('Estado no reconocido'));
        // }

     });
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
            (profesion) => ListTile(title: Text(profesion))
          ).toList()
          
        ]
       ),
    );
  }
}