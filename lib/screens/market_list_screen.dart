import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/market.dart';
import '../widgets/market_list_item.dart';
import '../providers/market_provider.dart';

class MarketListScreen extends ConsumerStatefulWidget {
  const MarketListScreen({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MarketListScreen> createState() => _MarketListScreenState();
}

class _MarketListScreenState extends ConsumerState<MarketListScreen> {
  @override
  Widget build(BuildContext context) {
    final marketsAsync = ref.watch(marketProviderProvider(null));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(marketProviderProvider(null)),
          ),
        ],
      ),
      body: marketsAsync.when(
        data: (markets) => _buildMarketList(markets),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Error: $error',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMarketList(List<Market> markets) {
    if (markets.isEmpty) {
      return const Center(
        child: Text('No markets available'),
      );
    }

    return ListView.builder(
      itemCount: markets.length,
      itemBuilder: (ctx, idx) {
        final market = markets[idx];
        return MarketListItem(market: market);
      },
    );
  }
}
