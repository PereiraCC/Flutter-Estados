import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // print(Get.arguments); 
    final usuarioCtrl = Get.find<UsuarioController>();
    
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
                usuarioCtrl.cargarUsuario(new Usuario(nombre: 'Carlos', edad: 35));
                Get.snackbar(
                  'Usuario establecido', 
                  'Carlos es el nombre del usuario',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(  
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]
                );
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue[200],
              onPressed: () => usuarioCtrl.cambiarEdad(20),
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue[200],
              onPressed: () => usuarioCtrl.agregarProfesion('Profesion #${usuarioCtrl.profesionesCount + 1}'),
            ),

            MaterialButton(
              child: Text('Cambiar Tema', style: TextStyle(color: Colors.white)),
              color: Colors.blue[200],
              onPressed: () {
                Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              } 
            )


          ],
        )
     ),
   );
  }
}