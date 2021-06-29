import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/framework/bloc/feedback/feedback_bloc.dart';
import 'package:feedback_app/framework/repository/feedback/feedback_repository.dart';
import 'package:feedback_app/generated/l10n.dart';
import 'package:feedback_app/models/feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes.dart';

class FeedbackListScreen extends StatefulWidget {
  @override
  _FeedbackListScreenState createState() => _FeedbackListScreenState();
}

class _FeedbackListScreenState extends State<FeedbackListScreen> {
  FeedbackBloc _feedbackBloc;

  @override
  void initState() {
    _feedbackBloc = FeedbackBloc(
        feedbackRepository: FeedbackRepositoryBuilder.repository());

    _feedbackBloc.add(GetFeedbackEvent());
    super.initState();
  }

  String getCount(String value) {
    if (value == null) {
      return '';
    }

    if (value.isNotEmpty || value != "") {
      return value.split(',')?.length?.toString() ?? '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(S.current.navBarTitleFeedback)),
      body: BlocConsumer<FeedbackBloc, FeedbackState>(
        bloc: _feedbackBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('feedback').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  var feedback = snapshot.data.docs
                      .map((i) => FeedbackModel.fromJson(i.data()))
                      .toList();
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: new ListView.builder(
                        itemCount: feedback.length,
                        itemBuilder: (context, index) {
                          var likesCount = getCount(feedback[index].likes);
                          var disLikeCount = getCount(feedback[index].disLikes);
                          var docId = snapshot.data.docs[index].id;
                          var reporterName =
                              (feedback[index]?.anonymous ?? false)
                                  ? S.current.pageAddFeedbackAnonymous
                                  : feedback[index]?.reporterName ?? '-';
                          return Card(
                            child: new Container(
                              margin: EdgeInsets.all(8.0),
                              child: new Column(
                                children: [
                                  new Row(
                                    children: [
                                      new Flexible(
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //TODO: Title
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  left: 8,
                                                ),
                                                child: new Text(
                                                  feedback[index].title,
                                                  style: new TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            //TODO: Description
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  left: 8,
                                                  top: 8,
                                                ),
                                                child: new Text(
                                                  feedback[index].description,
                                                  style: new TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                )),
                                            SizedBox(height: 8),
                                            //TODO: Likes & DisLike
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 8, left: 8),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        new Container(
                                                          width: likesCount
                                                                      .length >
                                                                  0
                                                              ? 70.0
                                                              : 50,
                                                          height: 25.0,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color(
                                                                      int.parse(
                                                                          "0xFFECF1F5")),
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .black26,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          child: new Row(
                                                            children: [
                                                              IconButton(
                                                                onPressed: () {
                                                                  _feedbackBloc.add(
                                                                      IsLikeFeedbackEvent(
                                                                          isLiked:
                                                                              true,
                                                                          docId:
                                                                              docId));
                                                                },
                                                                padding:
                                                                    new EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            1.0),
                                                                icon: Icon(
                                                                    Icons
                                                                        .thumb_up,
                                                                    size: 16.0,
                                                                    color: Color(
                                                                        int.parse(
                                                                            "0xFF1D293F"))),
                                                              ),
                                                              Text(
                                                                likesCount,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 8,
                                                                  color: Color(
                                                                      int.parse(
                                                                          "0xFF1D293F")),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 5.0),
                                                          child: new Container(
                                                              width: disLikeCount
                                                                          .length >
                                                                      0
                                                                  ? 70.0
                                                                  : 50,
                                                              height: 25.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Color(
                                                                          int.parse(
                                                                              "0xFFECF1F5")),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black26,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              20))),
                                                              child: new Row(
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        _feedbackBloc.add(IsLikeFeedbackEvent(
                                                                            isLiked:
                                                                                false,
                                                                            docId:
                                                                                docId));
                                                                      },
                                                                      padding: new EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              1.0),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .thumb_down,
                                                                        color: Color(
                                                                            int.parse("0xFF1D293F")),
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      disLikeCount,
                                                                      style: TextStyle(
                                                                          color: Color(int.parse(
                                                                              "0xFF1D293F")),
                                                                          fontSize:
                                                                              8),
                                                                    ),
                                                                  ])),
                                                        ),
                                                      ],
                                                    ),
                                                    //TODO: ReporterDetails
                                                    new Text(
                                                      '${S.current.pageAddFeedbackReporterName} : $reporterName',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption
                                                          .apply(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.7),
                                                              fontSizeDelta:
                                                                  0.1),
                                                    )
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.warning),
                        ),
                        Text('Error in loading data')
                      ],
                    ),
                  );
                }
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, Routes.feedbackCreationRoute);
        },
      ),
    ));
  }
}
