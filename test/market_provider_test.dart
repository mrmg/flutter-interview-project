import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interview/models/market.dart';
import 'package:interview/providers/market_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter/foundation.dart';

class TestAssetBundle extends CachingAssetBundle {
  final Map<String, String> mockAssets;
  TestAssetBundle(this.mockAssets);

  @override
  Future<ByteData> load(String key) async {
    throw UnimplementedError();
  }

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (!mockAssets.containsKey(key)) {
      throw FlutterError('Asset not found: $key');
    }
    return mockAssets[key]!;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('marketProvider', () {
    test('loads markets successfully from mock data', () async {
      const mockJson = '''
      {
        "data": [
          {
            "CompanyName": "Test Company",
            "Epic": "TEST",
            "CurrentPrice": "100.00"
          }
        ]
      }
      ''';
      final mockBundle = TestAssetBundle({
        'assets/markets.json': mockJson,
      });
      final container = ProviderContainer();
      final markets =
          await container.read(marketProviderProvider(mockBundle).future);
      expect(markets.length, 1);
      expect(markets[0].name, 'Test Company');
      expect(markets[0].epic, 'TEST');
      expect(markets[0].price, '100.00');
    });

    test('handles invalid JSON format from mock data', () async {
      const mockJson = '{"invalid": "format"}';
      final mockBundle = TestAssetBundle({
        'assets/markets.json': mockJson,
      });
      final container = ProviderContainer();
      expect(
        () async =>
            await container.read(marketProviderProvider(mockBundle).future),
        throwsException,
      );
    });

    test('loads markets from real asset file', () async {
      final container = ProviderContainer();
      final markets = await container.read(marketProviderProvider(null).future);
      expect(markets, isA<List<Market>>());
      expect(markets.length, greaterThan(0));
    });
  });
}
