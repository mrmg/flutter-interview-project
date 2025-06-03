import 'package:flutter/material.dart';
import '../models/market.dart';

class MarketListItem extends StatelessWidget {
  final Market market;

  const MarketListItem({
    super.key,
    required this.market,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide.none,
          horizontal: BorderSide(
            width: 1.0,
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  market.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  market.epic,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
            child: Text(
              "£${market.price}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
