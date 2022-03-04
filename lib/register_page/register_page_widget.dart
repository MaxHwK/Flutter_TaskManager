import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({Key key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  TextEditingController inputConfPwdController;
  bool inputConfPwdVisibility;
  TextEditingController inputEmailController;
  TextEditingController inputUsernameController;
  TextEditingController inputPasswordController;
  bool inputPasswordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    inputConfPwdController = TextEditingController();
    inputConfPwdVisibility = false;
    inputEmailController = TextEditingController();
    inputUsernameController = TextEditingController();
    inputPasswordController = TextEditingController();
    inputPasswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF131619),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: BoxDecoration(
                  color: Color(0xFF131619),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 20, 40, 20),
                  child: Image.asset(
                    'assets/images/login.gif',
                    width: 10,
                    height: 10,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 36),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          controller: inputUsernameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Nom d\'utilisateur',
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                            hintText: 'Entrez votre nom ...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).darkBG,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFFCE00FF),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: TextFormField(
                            controller: inputEmailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                              hintText: 'Entrez votre email ...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).darkBG,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color(0xFFCE00FF),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: TextFormField(
                            controller: inputPasswordController,
                            obscureText: !inputPasswordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Mot de passe',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                              hintText: 'Entrez votre mot de passe ...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).darkBG,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Color(0xFFCE00FF),
                              ),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => inputPasswordVisibility =
                                      !inputPasswordVisibility,
                                ),
                                child: Icon(
                                  inputPasswordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFFCE00FF),
                                  size: 22,
                                ),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: TextFormField(
                            controller: inputConfPwdController,
                            obscureText: !inputConfPwdVisibility,
                            decoration: InputDecoration(
                              labelText: 'Confirmation du mot de passe',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                              hintText: 'Confirmez votre mot de passe ...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).darkBG,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Color(0xFFCE00FF),
                              ),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => inputConfPwdVisibility =
                                      !inputConfPwdVisibility,
                                ),
                                child: Icon(
                                  inputConfPwdVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFFCE00FF),
                                  size: 22,
                                ),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (inputPasswordController.text !=
                                  inputConfPwdController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Passwords don\'t match!',
                                    ),
                                  ),
                                );
                                return;
                              }

                              final user = await createAccountWithEmail(
                                context,
                                inputEmailController.text,
                                inputPasswordController.text,
                              );
                              if (user == null) {
                                return;
                              }

                              final usersCreateData = createUsersRecordData(
                                username: inputUsernameController.text,
                                createdTime: getCurrentTimestamp,
                              );
                              await UsersRecord.collection
                                  .doc(user.uid)
                                  .update(usersCreateData);

                              Navigator.pop(context);
                            },
                            text: 'S\'inscrire',
                            icon: Icon(
                              Icons.person_add_alt_1,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 200,
                              height: 50,
                              color: Color(0xFFCE00FF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 10,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                                child: Text(
                                  'Tu possèdes déjà un compte ?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 200),
                                        reverseDuration:
                                            Duration(milliseconds: 200),
                                        child: LoginPageWidget(),
                                      ),
                                    );
                                  },
                                  text: 'Connectes-toi',
                                  options: FFButtonOptions(
                                    width: 120,
                                    height: 30,
                                    color: Color(0xFF131619),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFFCE00FF),
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
