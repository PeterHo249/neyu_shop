import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neyu_shop/models/address.dart';
import 'package:neyu_shop/models/customer.dart';
import 'package:neyu_shop/models/order.dart';
import 'package:neyu_shop/models/order_entry.dart';
import 'package:neyu_shop/models/product.dart';
import 'package:neyu_shop/utils/utilities.dart';

class DataProvider {
  static final DataProvider _singleton = DataProvider._internal();

  DataProvider._internal();

  static DataProvider get instance => _singleton;

  Order currentOrder = Order(
    generateRandomString(10),
    Customer(
      generateRandomString(10),
      generateRandomString(10),
      Address(
        generateRandomString(10),
        generateRandomString(10),
        generateRandomString(10),
      ),
    ),
    [],
    0,
    DateTime.now(),
    "Đang mua hàng",
  );

  Stream<QuerySnapshot> getProductList() {
    return FirebaseFirestore.instance.collection('products').snapshots();
  }

  addNewProduct(Product product) async {
    var batch = FirebaseFirestore.instance.batch();
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('products').doc(product.id);
    batch.set(docRef, json.decode(json.encode(product)));

    await batch.commit().catchError((error) => print('Error: $error'));
  }

  void addItemToCart({required Product product, int amount = 1}) {
    currentOrder.addItem(
      product: product,
      amount: amount,
    );
  }

  void setItemAmount({required OrderEntry item, int amount = 1}) {
    currentOrder.changeAmount(
      item: item,
      amount: amount,
    );
  }

  void removeItem({required OrderEntry item}) {
    currentOrder.removeItem(item: item);
  }

  void resetCurrentOrder() {
    currentOrder = Order(
      generateRandomString(10),
      Customer(
        generateRandomString(10),
        generateRandomString(10),
        Address(
          generateRandomString(10),
          generateRandomString(10),
          generateRandomString(10),
        ),
      ),
      [],
      0,
      DateTime.now(),
      "Đang mua hàng",
    );
  }

  Stream<DocumentSnapshot> getBlogpost(String blogId) {
    return FirebaseFirestore.instance
        .collection('blogposts')
        .doc(blogId)
        .snapshots();
  }

  Future<List<Customer>> getCustomers() async {
    var customerInfos =
        await FirebaseFirestore.instance.collection('customers').get();
    return customerInfos.docs
        .map(
          (info) => Customer.fromJson(
            json.decode(
              json.encode(
                info.data(),
              ),
            ),
          ),
        )
        .toList();
  }

  writeCustomer(Customer customer) async {
    var batch = FirebaseFirestore.instance.batch();
    var docRef = FirebaseFirestore.instance
        .collection("customers")
        .doc(customer.phoneNumber);

    batch.set(
      docRef,
      json.decode(
        json.encode(
          customer,
        ),
      ),
    );

    await batch.commit().catchError((error) => print("Error: $error"));
  }

  writeOrder(Order order) async {
    var batch = FirebaseFirestore.instance.batch();
    var docRef = FirebaseFirestore.instance.collection("orders").doc(order.id);

    batch.set(
      docRef,
      json.decode(
        json.encode(
          order,
        ),
      ),
    );

    await batch.commit().catchError((error) => print("Error: $error"));
  }
}
