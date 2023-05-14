class ResultQueryPagesTerms {
  List<String?>? description;

  ResultQueryPagesTerms({
    this.description,
  });
  ResultQueryPagesTerms.fromJson(Map<String, dynamic> json) {
    if (json['description'] != null) {
      final v = json['description'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      description = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (description != null) {
      final v = description;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['description'] = arr0;
    }
    return data;
  }
}

class ResultQueryPagesThumbnail {
/*
{
  "source": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Sachin-Tendulkar.jpg/50px-Sachin-Tendulkar.jpg",
  "width": 50,
  "height": 39
} 
*/

  String? source;
  int? width;
  int? height;

  ResultQueryPagesThumbnail({
    this.source,
    this.width,
    this.height,
  });
  ResultQueryPagesThumbnail.fromJson(Map<String, dynamic> json) {
    source = json['source']?.toString();
    width = json['width']?.toInt();
    height = json['height']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['source'] = source;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class ResultQueryPages {
/*
{
  "pageid": 57570,
  "ns": 0,
  "title": "Sachin Tendulkar",
  "index": 1,
  "thumbnail": {
    "source": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Sachin-Tendulkar.jpg/50px-Sachin-Tendulkar.jpg",
    "width": 50,
    "height": 39
  },
  "terms": {
    "description": [
      "Indian cricketer"
    ]
  }
} 
*/

  int? pageid;
  int? ns;
  String? title;
  int? index;
  ResultQueryPagesThumbnail? thumbnail;
  ResultQueryPagesTerms? terms;

  ResultQueryPages({
    this.pageid,
    this.ns,
    this.title,
    this.index,
    this.thumbnail,
    this.terms,
  });
  ResultQueryPages.fromJson(Map<String, dynamic> json) {
    pageid = json['pageid']?.toInt();
    ns = json['ns']?.toInt();
    title = json['title']?.toString();
    index = json['index']?.toInt();
    thumbnail = (json['thumbnail'] != null)
        ? ResultQueryPagesThumbnail.fromJson(json['thumbnail'])
        : null;
    terms = (json['terms'] != null)
        ? ResultQueryPagesTerms.fromJson(json['terms'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['pageid'] = pageid;
    data['ns'] = ns;
    data['title'] = title;
    data['index'] = index;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    if (terms != null) {
      data['terms'] = terms!.toJson();
    }
    return data;
  }
}

class ResultQueryRedirects {
/*
{
  "index": 4,
  "from": "Sachin The Film",
  "to": "Sachin: A Billion Dreams"
} 
*/

  int? index;
  String? from;
  String? to;

  ResultQueryRedirects({
    this.index,
    this.from,
    this.to,
  });
  ResultQueryRedirects.fromJson(Map<String, dynamic> json) {
    index = json['index']?.toInt();
    from = json['from']?.toString();
    to = json['to']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['index'] = index;
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}

class ResultQuery {
/*
{
  "redirects": [
    {
      "index": 4,
      "from": "Sachin The Film",
      "to": "Sachin: A Billion Dreams"
    }
  ],
  "pages": [
    {
      "pageid": 57570,
      "ns": 0,
      "title": "Sachin Tendulkar",
      "index": 1,
      "thumbnail": {
        "source": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Sachin-Tendulkar.jpg/50px-Sachin-Tendulkar.jpg",
        "width": 50,
        "height": 39
      },
      "terms": {
        "description": [
          "Indian cricketer"
        ]
      }
    }
  ]
} 
*/

  List<ResultQueryRedirects?>? redirects;
  List<ResultQueryPages?>? pages;

  ResultQuery({
    this.redirects,
    this.pages,
  });
  ResultQuery.fromJson(Map<String, dynamic> json) {
    if (json['redirects'] != null) {
      final v = json['redirects'];
      final arr0 = <ResultQueryRedirects>[];
      v.forEach((v) {
        arr0.add(ResultQueryRedirects.fromJson(v));
      });
      redirects = arr0;
    }
    if (json['pages'] != null) {
      final v = json['pages'];
      final arr0 = <ResultQueryPages>[];
      v.forEach((v) {
        arr0.add(ResultQueryPages.fromJson(v));
      });
      pages = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (redirects != null) {
      final v = redirects;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['redirects'] = arr0;
    }
    if (pages != null) {
      final v = pages;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['pages'] = arr0;
    }
    return data;
  }
}

class ResultContinue {
/*
{
  "gpsoffset": 10,
  "continue": "gpsoffset||"
} 
*/

  int? gpsoffset;
  String? theContinue;

  ResultContinue({
    this.gpsoffset,
    this.theContinue,
  });
  ResultContinue.fromJson(Map<String, dynamic> json) {
    gpsoffset = json['gpsoffset']?.toInt();
    theContinue = json['continue']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['gpsoffset'] = gpsoffset;
    data['continue'] = theContinue;
    return data;
  }
}

class Result {
/*
{
  "batchcomplete": true,
  "continue": {
    "gpsoffset": 10,
    "continue": "gpsoffset||"
  },
  "query": {
    "redirects": [
      {
        "index": 4,
        "from": "Sachin The Film",
        "to": "Sachin: A Billion Dreams"
      }
    ],
    "pages": [
      {
        "pageid": 57570,
        "ns": 0,
        "title": "Sachin Tendulkar",
        "index": 1,
        "thumbnail": {
          "source": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Sachin-Tendulkar.jpg/50px-Sachin-Tendulkar.jpg",
          "width": 50,
          "height": 39
        },
        "terms": {
          "description": [
            "Indian cricketer"
          ]
        }
      }
    ]
  }
} 
*/

  bool? batchcomplete;
  ResultContinue? theContinue;
  ResultQuery? query;

  Result({
    this.batchcomplete,
    this.theContinue,
    this.query,
  });
  Result.fromJson(Map<String, dynamic> json) {
    batchcomplete = json['batchcomplete'];
    theContinue = (json['continue'] != null)
        ? ResultContinue.fromJson(json['continue'])
        : null;
    query =
        (json['query'] != null) ? ResultQuery.fromJson(json['query']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['batchcomplete'] = batchcomplete;
    if (theContinue != null) {
      data['continue'] = theContinue!.toJson();
    }
    if (query != null) {
      data['query'] = query!.toJson();
    }
    return data;
  }
}
