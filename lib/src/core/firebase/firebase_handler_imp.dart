import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/firebase/firebase_handler.dart';


///Utilizar uma abstracao de todos os plugins possiveis para evitar que tenhamos
///de alterar o codigo em varios lugar
///FirebaseHandlerImp vai por exemplo lidar com a inicializacao do pacote
class FirebaseHandlerImp implements IFirebaseHandler {

  @override
  Future initFirebase() async {
    try{

    }catch(err){
      debugPrint("Erro ao inicializar o app $err");
    }
  }

}