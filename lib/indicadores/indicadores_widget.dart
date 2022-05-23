import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class IndicadoresWidget extends StatefulWidget {
  const IndicadoresWidget({Key key}) : super(key: key);

  @override
  _IndicadoresWidgetState createState() => _IndicadoresWidgetState();
}

class _IndicadoresWidgetState extends State<IndicadoresWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Indicadores'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).primaryBtnText,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                child: Text(
                                  'Indicadores de Salud',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 66),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.handHoldingWater,
                              color: Color(0xFF0029FF),
                              size: 24,
                            ),
                            title: Text(
                              'Medición de líquidos',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            subtitle: Text(
                              'Lorem ipsum dolor...',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 24,
                            ),
                            tileColor: Colors.white,
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 16, 16, 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.weight,
                                color: Color(0xFF6A19ED),
                                size: 24,
                              ),
                              title: Text(
                                'Peso corporal',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              subtitle: Text(
                                'Lorem ipsum dolor...',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 24,
                              ),
                              tileColor: Colors.white,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 16, 16, 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.solidDotCircle,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                size: 24,
                              ),
                              title: Text(
                                'Presión arterial',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              subtitle: Text(
                                'Lorem ipsum dolor...',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 24,
                              ),
                              tileColor: Colors.white,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 16, 16, 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.heartbeat,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 24,
                              ),
                              title: Text(
                                'Presión arterial',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              subtitle: Text(
                                'Lorem ipsum dolor...',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 24,
                              ),
                              tileColor: Colors.white,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 16, 16, 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
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
      ),
    );
  }
}
