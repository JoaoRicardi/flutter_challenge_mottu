import 'package:flutter/cupertino.dart';
import 'package:flutter_challenge/src/core/di/di_handler.dart';
import 'package:flutter_challenge/src/core/di/di_handler_imp.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler.dart';

mixin BaseWidgetStateless on StatelessWidget {

  T get<T extends Object>(){
    IDIHandler _injection = DIHandlerImp();
    return _injection.get<T>();
  }

  INavigationHandler get navigationHandler => get<INavigationHandler>();

}


mixin BaseWidgetStateful on State {

  T get<T extends Object>(){
    IDIHandler _injection = DIHandlerImp();
    return _injection.get<T>();
  }


}