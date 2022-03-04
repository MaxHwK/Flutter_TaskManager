import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletedTasksWidget extends StatefulWidget {
  const CompletedTasksWidget({Key key}) : super(key: key);

  @override
  _CompletedTasksWidgetState createState() => _CompletedTasksWidgetState();
}

class _CompletedTasksWidgetState extends State<CompletedTasksWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ToDoListRecord>>(
      stream: queryToDoListRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<ToDoListRecord> completedTasksToDoListRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final completedTasksToDoListRecord =
            completedTasksToDoListRecordList.isNotEmpty
                ? completedTasksToDoListRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFFCE00FF),
            automaticallyImplyLeading: false,
            title: Text(
              'Tâches Complétées',
              style: FlutterFlowTheme.of(context).title2,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).darkBG,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                      child: Text(
                        'Voici la liste de mes tâches effectuées.',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: StreamBuilder<List<ToDoListRecord>>(
                            stream: queryToDoListRecord(
                              queryBuilder: (toDoListRecord) => toDoListRecord
                                  .where('toDoState', isEqualTo: true)
                                  .orderBy('toDoDate'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<ToDoListRecord> columnToDoListRecordList =
                                  snapshot.data;
                              if (columnToDoListRecordList.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/uiList_Empty@3x.png',
                                  ),
                                );
                              }
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      columnToDoListRecordList.length,
                                      (columnIndex) {
                                    final columnToDoListRecord =
                                        columnToDoListRecordList[columnIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBlack,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        columnToDoListRecord
                                                            .toDoName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2,
                                                      ),
                                                      if (columnToDoListRecord
                                                              .toDoState ??
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                                'd/M h:mm a',
                                                                completedTasksToDoListRecord
                                                                    .toDoDate),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayBG,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 12, 0),
                                                    child: ToggleIcon(
                                                      onPressed: () async {
                                                        final toDoListUpdateData =
                                                            createToDoListRecordData(
                                                          toDoState:
                                                              !columnToDoListRecord
                                                                  .toDoState,
                                                        );
                                                        await columnToDoListRecord
                                                            .reference
                                                            .update(
                                                                toDoListUpdateData);
                                                      },
                                                      value:
                                                          columnToDoListRecord
                                                              .toDoState,
                                                      onIcon: Icon(
                                                        Icons.check_circle,
                                                        color:
                                                            Color(0xFFCE00FF),
                                                        size: 25,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons.radio_button_off,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        size: 25,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
