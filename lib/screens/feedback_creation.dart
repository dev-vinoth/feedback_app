import 'package:feedback_app/framework/bloc/feedback/feedback_bloc.dart';
import 'package:feedback_app/framework/repository/feedback/feedback_repository.dart';
import 'package:feedback_app/generated/l10n.dart';
import 'package:feedback_app/localCache.dart';
import 'package:feedback_app/models/feedback_model.dart';
import 'package:flutter/material.dart';

class FeedbackCreationScreen extends StatefulWidget {
  @override
  _FeedbackCreationScreenState createState() => _FeedbackCreationScreenState();
}

class _FeedbackCreationScreenState extends State<FeedbackCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedCategory;
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _descCtrl = TextEditingController();
  TextEditingController _reporterNameCtrl = TextEditingController();
  bool _isAnonymous = false;

  FeedbackBloc _feedbackBloc;

  @override
  void initState() {
    _feedbackBloc = FeedbackBloc(
        feedbackRepository: FeedbackRepositoryBuilder.repository());
    super.initState();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _reporterNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(S.current.navBarTitleAddFeedback)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 4),
                    child: Text(
                      S.current.pageAddFeedbackTitle,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.caption.apply(
                            color: Colors.black54,
                          ),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    controller: _titleCtrl,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Colors.black26, width: 1.5),
                      ),
                      hintText: S.current.pageAddFeedbackEnterTitle,
                      hintStyle: TextStyle(
                        color: Colors.black26.withOpacity(0.5),
                      ),
                    ),
                    onChanged: (value) {
                      _formKey.currentState.validate();
                    },
                    validator: (value) {
                      return (value == null || value.isEmpty)
                          ? S.current.pageAddFeedbackEnterTitle
                          : null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 4),
                    child: Text(
                      S.current.pageAddFeedbackDescription,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .apply(color: Colors.black54),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black87),
                    controller: _descCtrl,
                    maxLines: 3,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Colors.black26, width: 1.5),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black26.withOpacity(0.5),
                      ),
                      hintText: S.current.pageAddFeedbackEnterDescription,
                    ),
                    onChanged: (value) {
                      _formKey.currentState.validate();
                    },
                    validator: (value) {
                      return (value == null || value.isEmpty)
                          ? S.current.pageAddFeedbackEnterDescription
                          : null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      S.current.pageAddFeedbackCategory,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .apply(color: Colors.black54),
                    ),
                  ),
                  Container(child: buildCategoryDropdown()),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 4),
                    child: Text(
                      S.current.pageAddFeedbackReporterName,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.caption.apply(
                            color: Colors.black54,
                          ),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    controller: _reporterNameCtrl,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Colors.black26, width: 1.5),
                      ),
                      hintText: S.current.pageAddFeedbackEnterReporterName,
                      hintStyle: TextStyle(
                        color: Colors.black26.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.pageAddFeedbackAnonymous,
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.headline6.apply(
                                color: Colors.black54,
                              ),
                        ),
                        Switch(
                            value: _isAnonymous,
                            onChanged: (value) {
                              setState(() {
                                _isAnonymous = value;
                              });
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Center(
                      child: Container(
                        width: width * 0.6,
                        child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }

                              FeedbackModel _feedback = new FeedbackModel();
                              _feedback.title = _titleCtrl.text;
                              _feedback.description = _descCtrl.text;
                              _feedback.reporterName = _reporterNameCtrl.text;
                              _feedback.category = _selectedCategory;
                              _feedback.anonymous = _isAnonymous;
                              _feedback.mobileNo = LocalCache().userMobNo;
                              _feedback.likes = null;
                              _feedback.disLikes = null;

                              _feedbackBloc.add(
                                  AddFeedbackEvent(feedbackModel: _feedback));
                              Navigator.of(context).pop();
                            },
                            child: Text(S.current.pageAddFeedbackPost)),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    ));
  }

  DropdownButton<String> buildCategoryDropdown() {
    return DropdownButton<String>(
      focusColor: Colors.white,
      value: _selectedCategory,
      //elevation: 5,
      style: TextStyle(color: Colors.white),
      iconEnabledColor: Colors.black,
      items: <String>[
        'Network',
        'Feedback',
        'Input',
        'Hardware',
        'Inter-Team',
        'Collaboration',
        'Other',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      hint: Text(
        S.current.pageAddFeedbackSelectCategory,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
      ),
      onChanged: (String value) {
        setState(() {
          _selectedCategory = value;
        });
      },
    );
  }
}
