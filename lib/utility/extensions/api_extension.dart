enum ApiServiceConts {
  pharmacy,
  city,
  baseUrl,
  authorization,
  contentType,
  contentTypeName,
  county,
  authorizationToken,
  apikey
}

extension ApiPathsExtension on ApiServiceConts {
  String get value {
    switch (this) {
      case ApiServiceConts.pharmacy:
        return 'pharmacy';
      case ApiServiceConts.city:
        return 'city';
      case ApiServiceConts.baseUrl:
        return 'https://www.nosyapi.com/apiv2/';
      case ApiServiceConts.authorization:
        return 'authorization';
      case ApiServiceConts.contentType:
        return 'application/json';
      case ApiServiceConts.contentTypeName:
        return 'Content-Type';
      case ApiServiceConts.county:
        return 'contentType';
      case ApiServiceConts.authorizationToken:
        return 'YOUR_API_KEY';
      case ApiServiceConts.apikey:
        return 'YOUR_API_KEY';
    }
  }
}
