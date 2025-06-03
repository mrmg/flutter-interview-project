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
  return jsonList.map((value) {
    // Validate required fields
    if (!value.containsKey('CompanyName') ||
        !value.containsKey('Epic') ||
        !value.containsKey('CurrentPrice')) {
      throw Exception('Invalid market data: missing required fields');
    }

    // Validate price format
    final price = value["CurrentPrice"].toString().trim();
    if (price.isEmpty || !RegExp(r'^\d+(\.\d{1,3})?$').hasMatch(price)) {
      throw Exception(
          'Invalid price format: must be a number with 0 to 3 decimal places');
    }

    return Market(
      value["CompanyName"],
      value["Epic"],
      price,
    );
  }).toList();
}
