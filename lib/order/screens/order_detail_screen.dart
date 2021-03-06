import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flut_food/order/bloc/bloc.dart';
import 'package:flut_food/order/data_provider/order_provider.dart';
import 'package:flut_food/order/models/order.dart';

import '../../colors.dart';
import 'order_list_screen.dart';
import 'order_update_screen.dart';

class OrderDetailScreen extends StatelessWidget {
  static String routeName = "/orderDetailScreen";
  final Order _order;

  OrderDetailScreen(this._order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "ORDER DETAIL",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kLoginMainColor,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(context, OrderUpdateScreen.routeName,
                    arguments: this._order);
              }),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<OrderBloc>(context)
                    .add(OrderDelete(this._order));
                Navigator.pushNamed(context, OrderListScreen.routeName);
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Text(
              "Order Id ${this._order.id}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "User Id ${this._order.userId}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Item Id${this._order.itemId}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Quantity ${this._order.quantity}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Order State ${this._order.orderState}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
