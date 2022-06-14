import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/confirmacion_entrada_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PresionArteriaRefWidget extends StatefulWidget {
  const PresionArteriaRefWidget({
    Key key,
    this.recordatorio,
  }) : super(key: key);

  final DocumentReference recordatorio;

  @override
  _PresionArteriaRefWidgetState createState() =>
      _PresionArteriaRefWidgetState();
}

class _PresionArteriaRefWidgetState extends State<PresionArteriaRefWidget> {
  TextEditingController inputController;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0x3B1D2429),
                  offset: Offset(0, -3),
                )
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 40,
                          fillColor: Color(0xFFF4F5F9),
                          icon: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: Color(0xFF0F1113),
                            size: 16,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: Color(0xFFF4F5F9),
                            icon: Icon(
                              FFIcons.kasset20,
                              color: Color(0xFF0F1113),
                              size: 16,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Presión arterial',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 90,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: TextFormField(
                                  controller: inputController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Proxima nova',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          useGoogleFonts: false,
                                        ),
                                    hintText: '0',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Proxima nova',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1.5,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1.5,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 4),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Proxima nova',
                                        fontSize: 30,
                                        useGoogleFonts: false,
                                      ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                            Text(
                              'mmHg',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Proxima nova',
                                    fontSize: 30,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final indicadoresCreateData =
                                      createIndicadoresRecordData(
                                    tipo: 'Presón arterial',
                                    registro: inputController.text,
                                    fechaDeRegistro: getCurrentTimestamp,
                                  );
                                  await IndicadoresRecord.collection
                                      .doc()
                                      .set(indicadoresCreateData);
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: 250,
                                          child: ConfirmacionEntradaWidget(
                                            tipoParametro:
                                                'Medición de líquidos',
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                text: 'Confirmar',
                                options: FFButtonOptions(
                                  width: 150,
                                  height: 50,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Proxima nova',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontWeight: FontWeight.w600,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}