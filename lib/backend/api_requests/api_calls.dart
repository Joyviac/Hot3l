import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class HotelSearchLocationCall {
  static Future<ApiCallResponse> call({
    String? vIlle = '-1456928',
    String? checkoutdate = '2024-05-20',
    String? checkindate = '2024-05-19',
    String? adultsNumber = '1',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Hotel search location',
      apiUrl: 'https://booking-com.p.rapidapi.com/v1/hotels/search',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '9cdd6ae586msh897941f14a03d05p11cdf0jsnc68be997f756',
        'X-RapidAPI-Host': 'booking-com.p.rapidapi.com',
      },
      params: {
        'order_by': "popularity",
        'checkout_date': checkoutdate,
        'filter_by_currency': "EUR",
        'locale': "fr",
        'units': "metric",
        'dest_id': vIlle,
        'dest_type': "city",
        'adults_number': adultsNumber,
        'room_number': "1",
        'checkin_date': checkindate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? hotel(dynamic response) => getJsonField(
        response,
        r'''$.result''',
        true,
      ) as List?;
  static List<String>? photo(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].max_photo_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? adresshotel(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? codepostalehotel(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].zip''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nomhotel(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].hotel_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? prix(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].price_breakdown.all_inclusive_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? photo2(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].max_1440_photo_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? review(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].review_score''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? idhotel(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].hotel_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? hotelname2(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].hotel_name_trans''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VilleCall {
  static Future<ApiCallResponse> call({
    String? name = 'Paris',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Ville',
      apiUrl: 'https://booking-com.p.rapidapi.com/v1/hotels/locations',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '9cdd6ae586msh897941f14a03d05p11cdf0jsnc68be997f756',
        'X-RapidAPI-Host': 'booking-com.p.rapidapi.com',
      },
      params: {
        'name': name,
        'locale': "fr",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? ville(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].dest_id''',
      ));
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
