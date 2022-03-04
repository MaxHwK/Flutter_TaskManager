import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDetailsWidget extends StatefulWidget {
  const TaskDetailsWidget({
    Key key,
    this.toDoNote,
  }) : super(key: key);

  final DocumentReference toDoNote;

  @override
  _TaskDetailsWidgetState createState() => _TaskDetailsWidgetState();
}

class _TaskDetailsWidgetState extends State<TaskDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ToDoListRecord>(
      stream: ToDoListRecord.getDocument(widget.toDoNote),
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
        final taskDetailsToDoListRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBlack,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).tertiaryColor,
                size: 24,
              ),
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
                    Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBlack,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      taskDetailsToDoListRecord.toDoName,
                                      style:
                                          FlutterFlowTheme.of(context).title1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: StreamBuilder<ToDoListRecord>(
                                      stream: ToDoListRecord.getDocument(
                                          taskDetailsToDoListRecord.reference),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final descripTaskToDoListRecord =
                                            snapshot.data;
                                        return Text(
                                          descripTaskToDoListRecord
                                              .toDoDescription,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              indent: 16,
                              endIndent: 16,
                              color: FlutterFlowTheme.of(context).darkBG,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'À effectuer avant le ',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      dateTimeFormat('d/M h:mm a',
                                          taskDetailsToDoListRecord.toDoDate),
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      duration: Duration(milliseconds: 250),
                                      reverseDuration:
                                          Duration(milliseconds: 250),
                                      child: NavBarPage(
                                          initialPage: 'CompletedTasks'),
                                    ),
                                  );
                                  final toDoListUpdateData =
                                      createToDoListRecordData(
                                    toDoState: true,
                                  );
                                  await widget.toDoNote
                                      .update(toDoListUpdateData);
                                },
                                text: 'Compléter cette Tâche',
                                icon: Icon(
                                  Icons.check_circle_outline,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 56,
                                  color: Color(0xFFCE00FF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await widget.toDoNote.delete();
                                },
                                text: 'Supprimer cette Tâche',
                                icon: Icon(
                                  Icons.delete,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 56,
                                  color: Color(0xFFFF4B4B),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
