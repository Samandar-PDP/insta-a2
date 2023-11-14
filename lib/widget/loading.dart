import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?  /// dart:io dan bo'sin!
    const CupertinoActivityIndicator() :
    const CircularProgressIndicator();
  }
}