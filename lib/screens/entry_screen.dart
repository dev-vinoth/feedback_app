import 'package:feedback_app/generated/l10n.dart';
import 'package:feedback_app/localCache.dart';
import 'package:feedback_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Image.network(
              'http://image.listpipe.com/swipeclock-partner-stack-onboard-Mar-2019.jpg'),
          Center(
            child: Container(
              height: height * 0.2,
              child: Card(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            hintText: S.of(context).pageEntryEnterMobileNo,
                            labelText: S.current.pageEntryMobileNo,
                          ),
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                    ClipOval(
                      child: Container(
                        color: Colors.orange,
                        child: IconButton(
                            onPressed: () {
                              if (_controller.text.isNotEmpty) {
                                LocalCache().setUserMobNo(_controller.text);
                                Navigator.pushReplacementNamed(
                                    context, Routes.feedBackListRoute);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(S.current
                                            .pageEntryEnterValidNumber)));
                              }
                            },
                            icon: Icon(Icons.arrow_forward)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
