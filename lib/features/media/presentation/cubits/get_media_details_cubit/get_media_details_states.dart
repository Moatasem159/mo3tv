part of'get_media_details_cubit.dart';
abstract class GetMediaDetailsStates{}
class GetMediaDetailsInitialState extends GetMediaDetailsStates{}
class GetMediaDetailsLoadingState extends GetMediaDetailsStates{}
class GetMediaDetailsSuccessState extends GetMediaDetailsStates{}
class GetMediaDetailsErrorState extends GetMediaDetailsStates{
  final String msg;
  GetMediaDetailsErrorState({required this.msg});
}