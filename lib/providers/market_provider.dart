import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/market.dart';

part 'market_provider.g.dart';

@riverpod
Future<List<Market>> marketProvider(MarketProviderRef ref,
    [AssetBundle? bundle]) async {
  final assetBundle = bundle ?? rootBundle;
  final String jsonString = await assetBundle.loadString("assets/markets.json");
  final Map<String, dynamic> jsonData = jsonDecode(jsonString);

  if (!jsonData.containsKey('data')) {
    throw Exception('Invalid JSON format: missing "data" key');
  }

  final List jsonList = jsonData["data"];
  return jsonList
      .map((value) => Market(
            value["CompanyName"] ?? '',
            value["Epic"] ?? '',
            value["CurrentPrice"] ?? '',
          ))
      .toList();
}
