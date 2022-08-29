import 'package:flutter_challenge/src/core/di/di_handler.dart';
import 'package:flutter_challenge/src/core/di/di_handler_imp.dart';
import 'package:flutter_challenge/src/core/values/constants/constants.dart';

class BaseWidget {
  IDIHandler inject = DIHandlerImp();

  MottuConstants constants = MottuConstants();
}
