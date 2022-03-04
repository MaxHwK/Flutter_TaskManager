import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../register_page/register_page_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController inputEmailController;
  TextEditingController inputPasswordController;
  bool inputPasswordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    inputEmailController = TextEditingController();
    inputPasswordController = TextEditingController();
    inputPasswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF131619),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
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
                    padding: EdgeInsetsDirectional.fromSTEB(40, 40, 40, 40),
                    child: Image.asset(
                      'assets/images/login.gif',
                      width: 10,
                      height: 10,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextFormField(
                                controller: inputEmailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                      ),
                                  hintText: 'Entrez votre email ...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color:
                                            FlutterFlowTheme.of(context).white,
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
                                  fillColor:
                                      FlutterFlowTheme.of(context).darkBG,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Color(0xFFCE00FF),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Email non valide !';
                                  }

                                  return null;
                                },
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: TextFormField(
                                  controller: inputPasswordController,
                                  obscureText: !inputPasswordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Mot de passe',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                        ),
                                    hintText: 'Entrez votre mot de passe ...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
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
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                      ),
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Mot de passe incorrect !';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final user = await signInWithEmail(
                                      context,
                                      inputEmailController.text,
                                      inputPasswordController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBarPage(
                                            initialPage: 'DisplayTasks'),
                                      ),
                                      (r) => false,
                                    );
                                  },
                                  text: 'Se connecter',
                                  icon: Icon(
                                    Icons.person,
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
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 30),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 6),
                                        child: Text(
                                          'Tu n\'as pas encore de compte ? ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 200),
                                              reverseDuration:
                                                  Duration(milliseconds: 200),
                                              child: RegisterPageWidget(),
                                            ),
                                          );
                                        },
                                        text: 'Inscris-toi',
                                        options: FFButtonOptions(
                                          width: 100,
                                          height: 32,
                                          color: Color(0xFF131619),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFFCE00FF),
                                                  ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
