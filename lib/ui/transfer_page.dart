
import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:demo_180121_bloc/ui/item_transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget{
  final List<Transfer> listTransfer;

  const TransferPage({Key key, this.listTransfer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      body: ListView.builder(
        itemCount: listTransfer.length,
        itemBuilder: (context, index){
          return ItemTransfer(
            transfer: listTransfer[index],
          );
        },
      ),
    );
  }

}