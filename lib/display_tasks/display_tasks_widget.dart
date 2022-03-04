import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../new_task/new_task_widget.dart';
import '../task_details/task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayTasksWidget extends StatefulWidget {
  const DisplayTasksWidget({Key key}) : super(key: key);

  @override
  _DisplayTasksWidgetState createState() => _DisplayTasksWidgetState();
}

class _DisplayTasksWidgetState extends State<DisplayTasksWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFCE00FF),
        automaticallyImplyLeading: false,
        title: Text(
          'Toutes mes Tâches',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).darkBG,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('BtnNewTask pressed ...');
        },
        backgroundColor: Color(0xFFCE00FF),
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 48,
          icon: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).white,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                duration: Duration(milliseconds: 270),
                reverseDuration: Duration(milliseconds: 270),
                child: NewTaskWidget(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Voici la liste de toutes mes différentes tâches.',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<ToDoListRecord>>(
                        stream: queryToDoListRecord(
                          queryBuilder: (toDoListRecord) =>
                              toDoListRecord.orderBy('toDoDate'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<ToDoListRecord> columnToDoListRecordList =
                              snapshot.data;
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  List.generate(columnToDoListRecordList.length,
                                      (columnIndex) {
                                final columnToDoListRecord =
                                    columnToDoListRecordList[columnIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TaskDetailsWidget(
                                            toDoNote:
                                                columnToDoListRecord.reference,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      columnToDoListRecord
                                                          .toDoName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'd/M h:mm a',
                                                            columnToDoListRecord
                                                                .toDoDate),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 12, 0),
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
                                                    value: columnToDoListRecord
                                                        .toDoState,
                                                    onIcon: Icon(
                                                      Icons.check_circle,
                                                      color: Color(0xFFCE00FF),
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
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
