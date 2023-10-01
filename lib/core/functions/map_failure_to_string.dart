import 'package:mo3tv/core/error/failure.dart';
String mapFailureToMsg(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return "Server Failure";
    default:
      return " error";
  }
}