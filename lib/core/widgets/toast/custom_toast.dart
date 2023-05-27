import 'package:fluttertoast/fluttertoast.dart';
import 'package:mo3tv/core/widgets/toast/toast_widget.dart';
abstract class CustomToast{
  static showToast(context) {
    FToast().init(context);
    FToast().showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
      child: const ToastWidget(msg: "Something went wrong"),
    );
  }
}