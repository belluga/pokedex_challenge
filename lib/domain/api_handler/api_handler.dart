import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_challenge/domain/api_handler/api_settings_contract.dart';
import 'package:pokedex_challenge/domain/api_handler/endpoint_settings_contract.dart';
import 'package:pokedex_challenge/domain/api_handler/endpoint_type.dart';

class APIHandler {
  APIHandler({required this.apiSettings, required this.endpoint, this.data});

  @protected
  final APISettingsContract apiSettings;
  final EndpointSettingsContract endpoint;
  final Map<String, dynamic>? data;

  Uri get _uriGet => Uri.https(
        apiSettings.baseURL,
        "${apiSettings.path}${endpoint.node}",
        data?.map((key, value) => MapEntry(key, value.toString())),
      );

  Uri get _uriOtherMethods => Uri.https(
        apiSettings.baseURL,
        "${apiSettings.path}${endpoint.node}",
      );

  Future<Map<String, dynamic>> execute() async {
    var client = http.Client();

    late http.Response response;

    switch (endpoint.type) {
      case EndpointType.get:
        response = await client.get(_uriGet, headers: apiSettings.header);
        break;

      case EndpointType.post:
        response = await client.post(
          _uriOtherMethods,
          headers: apiSettings.header,
          body: data,
        );
        break;

      case EndpointType.delete:
        response = await client.delete(
          _uriOtherMethods,
          headers: apiSettings.header,
          body: data,
        );
        break;

      case EndpointType.patch:
        response = await client.patch(
          _uriOtherMethods,
          headers: apiSettings.header,
          body: data,
        );
        break;

      case EndpointType.update:
        response = await client.put(
          _uriOtherMethods,
          headers: apiSettings.header,
          body: data,
        );
        break;
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

    client.close();

    return decodedResponse;
  }
}
