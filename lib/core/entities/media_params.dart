class MediaParams {
  final int mediaId;
  final String mediaType;
  final String lang;
  final int page;
  final String listType;
  final dynamic rate;
  final bool mark;
  final String markType;
  final int seasonNumber;
  MediaParams({
    this.mediaType ='',
    this.mediaId = 0,
    this.lang = "en",
    this.page = 1,
    this.listType = '',
    this.rate = 0,
    this.mark = false,
    this.markType = '',
    this.seasonNumber = 0,
  });
}
