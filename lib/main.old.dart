import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Market {
  final String name;
  final String epic;
  final String price;

  Market(this.name, this.epic, this.price);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AJ Bell Market List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Markets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Market>? markets;

  @override
  void initState() {
    super.initState();
    loadMarkets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: markets?.length,
        itemBuilder: (ctx, idx) {
          final market = markets?[idx];
          return Container(
            decoration: BoxDecoration(
                border: Border.symmetric(
              vertical: BorderSide.none,
              horizontal: BorderSide(
                width: 1.0,
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        market?.name ?? "",
                        style: Theme.of(ctx).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        market?.epic ?? "",
                        style: Theme.of(ctx).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
                  child: Text(
                    "£${market?.price ?? ""}",
                    style: Theme.of(ctx).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void loadMarkets() async {
    final List jsonData = jsonDecode(await DefaultAssetBundle.of(context)
        .loadString("assets/markets.json"))["data"];
    final List<Market> mappedData = jsonData
        .asMap()
        .map(
          (key, value) {
            return MapEntry(
              key,
              Market(
                value["CompanyName"],
                value["Epic"],
                value["CurrentPrice"],
              ),
            );
          },
        )
        .values
        .toList();
    setState(
      () {
        markets = mappedData;
      },
    );
  }
}
