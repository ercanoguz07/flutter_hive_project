import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constant.dart';

class EToast {
  showMessage(toast, message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: toast,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.darkBrown,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
