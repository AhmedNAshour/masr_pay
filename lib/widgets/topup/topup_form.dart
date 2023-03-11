import 'package:flutter/material.dart';
import 'package:masr_pay/constants.dart';

class TopupForm extends StatefulWidget {
  final ValueChanged<String> onSubmit;
  const TopupForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<TopupForm> createState() => _TopupFormState();
}

class _TopupFormState extends State<TopupForm> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? _amount = 0;
  bool _submitted = false;
  int selectedBubble = 0;

  List<Map<String, dynamic>> amountOptions = [
    {'id': 0, 'amount': 200},
    {'id': 1, 'amount': 500},
    {'id': 2, 'amount': 1000},
    {'id': 3, 'amount': 5000},
    {'id': 4, 'amount': 10000},
    {'id': 5, 'amount': 20000},
  ];

  // dispose the controller when the widget is unmounted
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() => _submitted = true);
    // validate all the form fields
    if (_formKey.currentState!.validate()) {
      // on success, notify the parent widget
      widget.onSubmit(_amount.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Topup amount',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      border: InputBorder.none,
                    ),
                    autovalidateMode: _submitted
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode
                            .disabled, // use the validator to return an error string (or null) based on the input text
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'Please enter a number';
                      }
                      int? number = int.tryParse(value!);
                      if (number == null) {
                        return 'Please enter a valid number';
                      }
                      if (number <= 200) {
                        return 'Please enter a number greater than 200';
                      }
                      return null;
                    },
                    // update the state variable when the text changes
                    onChanged: (text) =>
                        setState(() => _amount = int.tryParse(text)),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: amountOptions.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.text =
                                    amountOptions[index]['amount'].toString();
                                _amount = amountOptions[index]['amount'];
                              });
                            },
                            child: Text(
                              amountOptions[index]['amount'].toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: height * 0.06,
          child: ElevatedButton(
            // only enable the button if the text is not empty
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _amount.toString().isNotEmpty ? _submit : null,
            child: const Text(
              'Confirm Topup',
            ),
          ),
        ),
      ],
    );
  }
}
