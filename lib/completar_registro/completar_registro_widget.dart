import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../seleccion_etapa/seleccion_etapa_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CompletarRegistroWidget extends StatefulWidget {
  const CompletarRegistroWidget({Key key}) : super(key: key);

  @override
  _CompletarRegistroWidgetState createState() =>
      _CompletarRegistroWidgetState();
}

class _CompletarRegistroWidgetState extends State<CompletarRegistroWidget> {
  String genderValue;
  TextEditingController edadController;
  TextEditingController alturaController;
  TextEditingController pesoController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    alturaController = TextEditingController();
    pesoController = TextEditingController();
    edadController = TextEditingController();
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
                              percent: 0.35,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  '??Comenc??mos! Por favor cu??ntenos un poco m??s de usted',
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
                                  'Con esto podremos personalizar la informaci??n que le daremos',
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
                        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Edad',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Proxima nova',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 88,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 8, 0),
                                    child: TextFormField(
                                      controller: edadController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Proxima nova',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              useGoogleFonts: false,
                                            ),
                                        hintText: '0',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Proxima nova',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC9C9C9),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC9C9C9),
                                            width: 1,
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
                                          .bodyText1,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                                Text(
                                  'a??os',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Sexo',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Proxima nova',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FlutterFlowRadioButton(
                                  options: [
                                    'Femenino',
                                    'Masculino',
                                    'Otro',
                                    'Prefiero no decirlo'
                                  ].toList(),
                                  onChanged: (value) {
                                    setState(() => genderValue = value);
                                  },
                                  optionHeight: 32,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Proxima nova',
                                        color: Colors.black,
                                        useGoogleFonts: false,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Altura',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Proxima nova',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 88,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: TextFormField(
                                            controller: alturaController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Proxima nova',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    useGoogleFonts: false,
                                                  ),
                                              hintText: '0',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Proxima nova',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    useGoogleFonts: false,
                                                  ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFC9C9C9),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFC9C9C9),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 16, 4),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'cm',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Peso',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Proxima nova',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 88,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: TextFormField(
                                          controller: pesoController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Proxima nova',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  useGoogleFonts: false,
                                                ),
                                            hintText: '0',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Proxima nova',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  useGoogleFonts: false,
                                                ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC9C9C9),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC9C9C9),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
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
                                              .bodyText1,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'kg',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
                  if ((pesoController.text != null) &&
                      (pesoController.text != ''))
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final usersUpdateData = createUsersRecordData(
                              height: alturaController.text,
                              gender: genderValue,
                              weight: pesoController.text,
                              age: int.parse(edadController.text),
                            );
                            await currentUserReference.update(usersUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SeleccionEtapaWidget(),
                              ),
                            );
                          },
                          text: 'Continuar',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Proxima nova',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
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
