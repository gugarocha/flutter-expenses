import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final void Function(String) onRemove;

  TransactionItem({
    Key? key,
    required this.transaction,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();

    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'R\$${widget.transaction.value}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text(
                  'Excluir',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () => widget.onRemove(widget.transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.onRemove(widget.transaction.id),
              ),
      ),
    );
    ;
  }
}
