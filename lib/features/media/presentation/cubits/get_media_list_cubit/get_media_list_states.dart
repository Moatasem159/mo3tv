part of'get_media_list_cubit.dart';
abstract class GetMediaListStates {}
class GetMediaListInitialState extends GetMediaListStates {}
class GetMediaListLoadingState extends GetMediaListStates{}
class GetMediaListSuccessState extends GetMediaListStates{
  final List<Media> media;
  final String time;
  final String lang;
  GetMediaListSuccessState(this.media, this.time, this.lang);
  Map<String, dynamic> toMap() {
    return {
      'media': MediaModel.mediaListToMap(media as List<MediaModel>),
      'time': time,
      'lang':lang,
    };
  }
  factory GetMediaListSuccessState.fromMap(Map<String, dynamic> map) {
    return GetMediaListSuccessState(
      MediaModel.mapToList(map["media"]),
      map['time'],
      map['lang'],
    );
  }
}
class GetMediaListErrorState extends GetMediaListStates{
  final String msg;
  GetMediaListErrorState({required this.msg});
}