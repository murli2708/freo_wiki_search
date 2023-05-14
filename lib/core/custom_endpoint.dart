class Endpoint {
  static String getSearchEndpoint({required String searchText}) {
    return 'https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=$searchText&gpslimit=10';
  }

  static String getDetaildEndpoint({required String pageId}) {
    return 'https://en.m.wikipedia.org/?curid=$pageId';
  }
}
