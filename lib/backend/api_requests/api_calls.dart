import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetAppoimentsCall {
  static Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getAppoiments',
      apiUrl:
          'https://wattlogic-dev1-yqj3xtptpq-uw.a.run.app/v1/contractors/me/bids',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic appoiments(dynamic response) => getJsonField(
        response,
        r'''$.elements''',
        true,
      );
}

class GetBidDetailsCall {
  static Future<ApiCallResponse> call({
    String? appId = '0',
    String? accessToken = '000',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getBidDetails',
      apiUrl:
          'https://wattlogic-dev1-yqj3xtptpq-uw.a.run.app/v1/bids/${appId}/mobi',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.spec.status''',
      );
  static dynamic mapDistance(dynamic response) => getJsonField(
        response,
        r'''$.spec.mapDistance''',
      );
  static dynamic adjustedDistance(dynamic response) => getJsonField(
        response,
        r'''$.spec.adjustedDistance''',
      );
  static dynamic panelVrun(dynamic response) => getJsonField(
        response,
        r'''$.spec.panelVrun''',
      );
  static dynamic chargerVrun(dynamic response) => getJsonField(
        response,
        r'''$.spec.chargerVrun''',
      );
  static dynamic routLat(dynamic response) => getJsonField(
        response,
        r'''$.spec.route[:].lat''',
        true,
      );
  static dynamic routLng(dynamic response) => getJsonField(
        response,
        r'''$.spec.route[:].lng''',
        true,
      );
  static dynamic chargerLatLng(dynamic response) => getJsonField(
        response,
        r'''$.inp.chargerLatLng''',
      );
  static dynamic panelLatLng(dynamic response) => getJsonField(
        response,
        r'''$.inp.panelLatLng''',
      );
  static dynamic chargerLocationPhoto(dynamic response) => getJsonField(
        response,
        r'''$.inp.photos.chargerLocation''',
      );
  static dynamic panelLocationPhoto(dynamic response) => getJsonField(
        response,
        r'''$.inp.photos.panelLocation''',
      );
  static dynamic panelInsidePhoto(dynamic response) => getJsonField(
        response,
        r'''$.inp.photos.panelInside''',
      );
  static dynamic customer(dynamic response) => getJsonField(
        response,
        r'''$.inp.customer''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.spec.id''',
      );
  static dynamic chargerLocation(dynamic response) => getJsonField(
        response,
        r'''$.chargerLocation''',
      );
  static dynamic propertyType(dynamic response) => getJsonField(
        response,
        r'''$.propertyType''',
      );
  static dynamic chargerId(dynamic response) => getJsonField(
        response,
        r'''$.charger.id''',
      );
  static dynamic chargerTitle(dynamic response) => getJsonField(
        response,
        r'''$.charger.title''',
      );
  static dynamic accessories(dynamic response) => getJsonField(
        response,
        r'''$.accessories''',
        true,
      );
  static dynamic ev(dynamic response) => getJsonField(
        response,
        r'''$.ev''',
      );
  static dynamic installDate(dynamic response) => getJsonField(
        response,
        r'''$.installDate''',
      );
  static dynamic street(dynamic response) => getJsonField(
        response,
        r'''$.address.street''',
      );
  static dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.address.city''',
      );
  static dynamic state(dynamic response) => getJsonField(
        response,
        r'''$.address.state''',
      );
  static dynamic zip(dynamic response) => getJsonField(
        response,
        r'''$.address.zip''',
      );
  static dynamic routes(dynamic response) => getJsonField(
        response,
        r'''$.spec.route''',
        true,
      );
}

class LoginInWattlogicCall {
  static Future<ApiCallResponse> call({
    String? jwtFirebase = '',
  }) {
    final body = '''
{
    "bearer": "${jwtFirebase}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginInWattlogic',
      apiUrl:
          'https://wattlogic-dev1-yqj3xtptpq-uw.a.run.app/v1/users/login/firebase',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class ResheduleAppoimentCall {
  static Future<ApiCallResponse> call({
    String? appId = '',
    String? accessToken = '',
    String? reasonForChange = '',
    String? newInstallDate = '',
  }) {
    final body = '''
{
  "rescheduleNotes": "${reasonForChange}",
  "installDate": "${newInstallDate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resheduleAppoiment',
      apiUrl:
          'https://wattlogic-dev1-yqj3xtptpq-uw.a.run.app/v1/bids/${appId}/mobi',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class AddBidNotesCall {
  static Future<ApiCallResponse> call({
    String? appId = '',
    String? accessToken = '',
    String? bidNotes = '',
  }) {
    final body = '''
{
  "bidNotes": "${bidNotes}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addBidNotes',
      apiUrl:
          'https://wattlogic-dev1-yqj3xtptpq-uw.a.run.app/v1/bids/${appId}/mobi',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class AddChangeOrderCall {
  static Future<ApiCallResponse> call({
    String? appId = '',
    String? accessToken = '',
    String? reason = '',
    String? material = '',
    String? labor = '',
    String? description = '',
  }) {
    final body = '''
{
  "changeOrder": {
    "reason": "${reason}",
    "material": "${material}",
    "labor": "${labor}",
    "description": "${description}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addChangeOrder',
      apiUrl:
          'https://wattlogic-dev1-yqj3xtptpq-uw.a.run.app/v1/bids/${appId}/mobi',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class AddTimeOnMyWayCall {
  static Future<ApiCallResponse> call({
    int? travelTimeMinutes,
    String? accessToken = '',
    String? appId = '',
  }) {
    final body = '''
{
 "travelTimeMinutes": "${travelTimeMinutes}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addTimeOnMyWay',
      apiUrl:
          'https://wattlogic-dev1-yqj3xtptpq-uw.a.run.app/v1/bids/${appId}/mobi',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class AddCustomerSignOffCall {
  static Future<ApiCallResponse> call({
    String? customerSignOffIssue = '',
    String? accessToken = '',
    String? appId = '',
  }) {
    final body = '''
{
 "customerSignOffIssue": "${customerSignOffIssue}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addCustomerSignOff',
      apiUrl:
          'https://wattlogic-dev1-yqj3xtptpq-uw.a.run.app/v1/bids/${appId}/mobi',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class SavePreInstallationPhotosCall {
  static Future<ApiCallResponse> call({
    String? appId = '',
    String? accessToken = '',
    String? listPhotos = '',
  }) {
    final body = '''
{
  "photos": {
    "pre-install": [
      "${listPhotos}"
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'savePreInstallationPhotos',
      apiUrl:
          'https://wattlogic-dev1-yqj3xtptpq-uw.a.run.app/v1/bids/${appId}/mobi',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class SavePostInstallationPhotosCall {
  static Future<ApiCallResponse> call({
    String? appId = '',
    String? accessToken = '',
    String? listPhotos = '',
  }) {
    final body = '''
{
  "photos": {
    "post-install": [
      "${listPhotos}"
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'savePostInstallationPhotos',
      apiUrl:
          'https://wattlogic-dev1-yqj3xtptpq-uw.a.run.app/v1/bids/${appId}/mobi',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}
