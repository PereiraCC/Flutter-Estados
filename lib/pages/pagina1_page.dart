import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/pages/pagina2_page.dart';
import 'package:estados/controllers/usuario_controller.dart';

class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.put( UsuarioController() );

    return Scaffold(
      appBar: AppBar(  
        title: Text('Pagina 1'),
        centerTitle: true,
      ),

      body: Obx( 
        () => usuarioCtrl.existeUsuario.value 
            ? _InformacionUsuario(usuario: usuarioCtrl.usuario.value)
            : _NoInfo()
      ),

      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.accessibility_new),
        //  onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        // onPressed: () => Get.to(Pagina2Page())
        onPressed: () => Get.toNamed('pagina2', arguments: {
          'nombre' : 'Carlos',
          'edad'   : 21
        })

      ),
   );
  }
}

class _NoInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center( 
        child: Text('No hay usuario seleccionado'),
      ),
    );
  }
}

class _InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const _InformacionUsuario({Key? key, required this.usuario}) : super(key: key);

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

          ...this.usuario.profesiones.map((profesion) => ListTile(  
            title: Text(profesion),
          ))        
        ]
       ),
    );
  }
}