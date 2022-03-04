import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../register_page/register_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBlack,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBlack,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              'assets/images/bg_login.png',
            ).image,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/homepage.gif',
                      width: 350,
                      height: 250,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 2, 0, 20),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterPageWidget(),
                                    ),
                                  );
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
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPageWidget(),
                                  ),
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
                                color: FlutterFlowTheme.of(context).white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFCE00FF),
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
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 0.8),
                                child: Text(
                                  '© GIRON Maxence - Projet Flutter 2022',
                                  style: FlutterFlowTheme.of(context).bodyText1,
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
            ],
          ),
        ),
      ),
    );
  }
}
