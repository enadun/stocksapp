import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    );
  }
}

class SubHeaderText extends StatelessWidget {
  final String text;
  const SubHeaderText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12),
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  const NormalText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 9),
    );
  }
}

class CurrencyText extends StatelessWidget {
  final String text;
  const CurrencyText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 15),
    );
  }
}

class PresentageText extends StatelessWidget {
  final double value;
  const PresentageText(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    final String prefix;
    final Color color;
    if (value > 0) {
      prefix = '+';
      color = Colors.green.shade900;
    } else {
      prefix = '';
      color = Colors.red.shade900;
    }
    return Text(
      '($prefix${value.toStringAsFixed(2)}%)',
      style: TextStyle(fontSize: 15, color: color),
    );
  }
}
