import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/main.dart';
import 'package:flutter_module/portfolio/portfolio_view.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  bool _isLoading = true;
  String? _json;

  @override
  void initState() {
    super.initState();
    _getPortfolioData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stocks'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => SystemNavigator.pop(),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: Text('Loading...'),
            )
          : PortfolioView(
              json: _json,
            ),
    );
  }

  Future<Void?> _getPortfolioData() async {
    try {
      final data =
          await MyApp.platformChannel.invokeMethod('get_portfolio') as String;
      _json = data;
      print(data);
    } catch (e) {
      _json = null;
      print('Failed $e');
    }
    setState(() {
      _isLoading = false;
    });

    return null;
  }
}
