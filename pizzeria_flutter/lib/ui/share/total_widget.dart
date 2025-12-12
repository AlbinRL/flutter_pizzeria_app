import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalWidget extends StatelessWidget {
  final double total;

  const TotalWidget({Key? key, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat.currency(locale: 'fr_FR', symbol: '€', decimalDigits: 2);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(child: Text('Total', style: const TextStyle(fontWeight: FontWeight.bold))),
          Text(fmt.format(total)),
        ],
      ),
    );
  }
}
