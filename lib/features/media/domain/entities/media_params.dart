import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
class MediaParams {
  final int mediaId;
  final String listTitle;
  final String mediaType;
  final String lang;
  final int page;
  final String listType;
  final dynamic rate;
  final bool mark;
  final String markType;
  final int seasonNumber;
  final String moreType;
  const MediaParams({
    this.listTitle='?',
    this.moreType='?',
    this.mediaType ='?',
    this.mediaId = 0,
    this.lang = "en",
    this.page = 1,
    this.listType = '?',
    this.rate = 0,
    this.mark = false,
    this.markType = '?',
    this.seasonNumber = 0,
  });
  String toJson() {
    return jsonEncode({
      'mediaId': mediaId,
      'listTitle': listTitle,
      'mediaType': mediaType,
      'lang': lang,
      'page': page,
      'listType': listType,
      'rate': rate,
      'mark': mark,
      'markType': markType,
      'seasonNumber': seasonNumber,
      'moreType': moreType,
    });
  }
  factory MediaParams.fromJson(String jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString);
    return MediaParams(
      mediaId: map['mediaId'],
      listTitle: map['listTitle'],
      mediaType: map['mediaType'],
      lang: map['lang'],
      page: map['page'],
      listType: map['listType'],
      rate: map['rate'],
      mark: map['mark'],
      markType: map['markType'],
      seasonNumber: map['seasonNumber'],
      moreType: map['moreType'],
    );
  }
}
class DetailsParams{
  final Cubit ?cubit;
  final Media media;
  final String listType;
  final String mediaType;
  DetailsParams({this.cubit, required this.media, required this.listType, required this.mediaType});
}