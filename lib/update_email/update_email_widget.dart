import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateEmailWidget extends StatefulWidget {
  const UpdateEmailWidget({
    Key key,
    this.displayName,
    this.email,
  }) : super(key: key);

  final UsersRecord displayName;
  final UsersRecord email;

  @override
  _UpdateEmailWidgetState createState() => _UpdateEmailWidgetState();
}

class _UpdateEmailWidgetState extends State<UpdateEmailWidget> {
  TextEditingController inputEmailController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
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
        List<UsersRecord> updateEmailUsersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final updateEmailUsersRecord = updateEmailUsersRecordList.isNotEmpty
            ? updateEmailUsersRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFFCE00FF),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).white,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Modification Email',
              style: FlutterFlowTheme.of(context).title2,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).darkBG,
          body: SafeArea(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBlack,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(currentUserReference),
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
                          final columnUsersRecord = snapshot.data;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 0, 0),
                                child: Text(
                                  'Veuillez saisir votre nouvel email.',
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 0),
                                child: TextFormField(
                                  controller: inputEmailController ??=
                                      TextEditingController(
                                    text: updateEmailUsersRecord.email,
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nouvel email',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    hintText: 'Votre nouvel email ...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0x9AFFFFFF),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).darkBG,
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final usersUpdateData =
                                              createUsersRecordData(
                                            email: inputEmailController?.text ??
                                                '',
                                          );
                                          await updateEmailUsersRecord.reference
                                              .update(usersUpdateData);
                                          Navigator.pop(context);
                                        },
                                        text: 'Sauvegarder',
                                        icon: Icon(
                                          Icons.save,
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 230,
                                          height: 50,
                                          color: Color(0xFFCE00FF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
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
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
