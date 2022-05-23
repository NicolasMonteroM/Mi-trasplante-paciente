import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../resume_registro/resume_registro_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SeleccionEtapaWidget extends StatefulWidget {
  const SeleccionEtapaWidget({Key key}) : super(key: key);

  @override
  _SeleccionEtapaWidgetState createState() => _SeleccionEtapaWidgetState();
}

class _SeleccionEtapaWidgetState extends State<SeleccionEtapaWidget> {
  String stageValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Seleccion_etapa'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: LinearPercentIndicator(
                              percent: 0.7,
                              width: MediaQuery.of(context).size.width * 0.9,
                              lineHeight: 8,
                              animation: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              backgroundColor: Color(0xFFF1F4F8),
                              barRadius: Radius.circular(8),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 50,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Color(0xFF0F1113),
                                  size: 24,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent('IconButton_ON_TAP');
                                  logFirebaseEvent('IconButton_Navigate-Back');
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Text(
                                'Regresar',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF0F1113),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  '¿En qué etapa se encuentra?',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Proxima nova',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  'Seleccione la opción que se acomode a usted',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Proxima nova',
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 14, 20, 0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: FlutterFlowDropDown(
                            options: [
                              'Me interesa ser donante',
                              'Estoy considerando realizarme un trasplante',
                              'Estoy en protocolo (toma de exámenes) para un trasplante renal',
                              'Estoy en lista de espera por un donante',
                              'Estoy próximo a tener mi trasplante de un donante vivo',
                              'Ya he sido trasplantado',
                              'He sido trasplantado y he perdido uno o varios injertos'
                            ].toList(),
                            onChanged: (val) =>
                                setState(() => stageValue = val),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Proxima nova',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                            hintText: 'Etapa en el proceso',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Color(0xFFC9C9C9),
                            borderWidth: 0,
                            borderRadius: 12,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 16),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('Button-Stage_ON_TAP');
                          logFirebaseEvent('Button-Stage_Backend-Call');

                          final usersUpdateData = createUsersRecordData(
                            stage: stageValue,
                          );
                          await currentUserReference.update(usersUpdateData);
                          logFirebaseEvent('Button-Stage_Navigate-To');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResumeRegistroWidget(),
                            ),
                          );
                        },
                        text: 'Continuar',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Proxima nova',
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
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
