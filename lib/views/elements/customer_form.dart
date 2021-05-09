import 'package:flutter/material.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/models/address.dart';
import 'package:neyu_shop/models/customer.dart';
import 'package:neyu_shop/views/elements/FadePageRoute.dart';
import 'package:neyu_shop/views/order_success.dart';

class CustomerForm extends StatefulWidget {
  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  List<Customer> customers = [];
  Customer currentCustomer = Customer(
    "",
    "",
    Address(
      "",
      "",
      "",
    ),
  );

  var phoneNumberController = TextEditingController();
  var nameController = TextEditingController();
  var provinceController = TextEditingController();
  var districtController = TextEditingController();
  var locatedPartController = TextEditingController();

  var formState = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    DataProvider.instance.getCustomers().then(
      (value) {
        customers = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = currentCustomer.name;
    provinceController.text = currentCustomer.address.province;
    districtController.text = currentCustomer.address.district;
    locatedPartController.text = currentCustomer.address.locatedPart;

    return Form(
      key: formState,
      child: Column(
        children: [
          TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              labelText: "Phone number",
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value.length == 10 && value != currentCustomer.phoneNumber) {
                setState(
                  () {
                    currentCustomer = customers.firstWhere(
                      (customer) {
                        return customer.phoneNumber == value;
                      },
                      orElse: () => Customer(
                        "",
                        "",
                        Address(
                          "",
                          "",
                          "",
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name",
            ),
            textCapitalization: TextCapitalization.words,
          ),
          TextFormField(
            controller: provinceController,
            decoration: InputDecoration(
              labelText: "Province",
            ),
          ),
          TextFormField(
            controller: districtController,
            decoration: InputDecoration(
              labelText: "District",
            ),
          ),
          TextFormField(
            controller: locatedPartController,
            decoration: InputDecoration(
              labelText: "Street",
            ),
          ),
          buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("Summit form");
        // TODO: Implement submit order here
        Navigator.of(context).push(
          FadePageRoute(
            SuccessOrder(),
          ),
        );
      },
      child: Text('Order'),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.all(
            15.0,
          ),
        ),
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 16.0,
        )),
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered))
              return Colors.amber[400];
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) return Colors.amber[60];
            return Colors.amber;
          },
        ),
      ),
    );
  }
}
