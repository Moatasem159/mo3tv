List pagination(List bigList, page, perPage) {
  List dataToShow = [];
  if ((page * perPage) + perPage <= bigList.length) {
    dataToShow =
        bigList.sublist((page * perPage), ((page * perPage) + perPage));
  } else {
    dataToShow = bigList.sublist((page * perPage));
  }
  return dataToShow;
}
