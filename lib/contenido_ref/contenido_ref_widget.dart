import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ContenidoRefWidget extends StatefulWidget {
  const ContenidoRefWidget({Key key}) : super(key: key);

  @override
  _ContenidoRefWidgetState createState() => _ContenidoRefWidgetState();
}

class _ContenidoRefWidgetState extends State<ContenidoRefWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Contenido_ref'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF0FFFE),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 0, 25, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Container(
                    width: 100,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Container(
                            width: 55,
                            height: 4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Container(
                            width: 55,
                            height: 4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Container(
                            width: 55,
                            height: 4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Container(
                            width: 55,
                            height: 4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Container(
                            width: 55,
                            height: 4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Icon(
                          FFIcons.kasset20,
                          color: Colors.black,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    'CATEGORÍA',
                    style: FlutterFlowTheme.of(context).subtitle2,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 50, 0),
                  child: Text(
                    '¿Cómo funciona la lista de espera?',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Proxima nova',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontSize: 32,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 40),
                    child: Image.asset(
                      'assets/images/Group_474.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  'La lista de espera para trasplantes es un gran registro de pacientes agrupados según el órgano o tejido que le deba ser trasplantado.\n\n\nEsta lista es auditada y regulada por el Instituto Nacional de Salud (INS), entidad que administra la plataforma llamada RED DATA. \n\n',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Proxima nova',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
