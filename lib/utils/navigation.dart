import 'package:flutter/material.dart';

Future push(BuildContext context, String page, {bool replace = false, bool removeUntil = false}) {

  if(replace) {
    return Navigator.pushReplacementNamed(context, page);
  }

  if(removeUntil){
    return Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
  }

  return Navigator.pushNamed(context, page);
}

bool pop<T extends Object>(BuildContext context, [ T? result ]) {
  if(Navigator.canPop(context)) {
    Navigator.pop(context);
    return true;
  }
  return false;
}