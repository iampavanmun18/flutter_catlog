import 'package:flutter/material.dart';
 class CheckoutAddressPage extends StatefulWidget {
  const CheckoutAddressPage({super.key});

  @override
  _CheckoutAddressPageState createState() => _CheckoutAddressPageState();
}
 class _CheckoutAddressPageState extends State<CheckoutAddressPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _address, _city, _state, _zip, _country;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Shipping Address',
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onSaved: (value) => _name = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onSaved: (value) => _address = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Address',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onSaved: (value) => _city = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'City',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onSaved: (value) => _state = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your state/province';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'State/Province',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onSaved: (value) => _zip = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your zip/postal code';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Zip/Postal Code',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onSaved: (value) => _country = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your country';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Save the address information to a database or
                      // pass it to the next page.
                      Navigator.pushReplacementNamed(
                          context, '/razorpay');
                    }
                  },
                  // color: Theme.of(context).primaryColor,
                  child: const Text(
                    'Proceed to Payment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
