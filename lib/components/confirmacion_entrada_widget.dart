import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmacionEntradaWidget extends StatefulWidget {
  const ConfirmacionEntradaWidget({
    Key key,
    this.tipoParametro,
  }) : super(key: key);

  final String tipoParametro;

  @override
  _ConfirmacionEntradaWidgetState createState() =>
      _ConfirmacionEntradaWidgetState();
}

class _ConfirmacionEntradaWidgetState extends State<ConfirmacionEntradaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
      child: InkWell(
        onTap: () async {
          logFirebaseEvent(
              'CONFIRMACION_ENTRADA_COMP_Container_qnwju8pd_ON_TAP');
          logFirebaseEvent('Container_Bottom-Sheet');
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
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
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).positiveFeedback,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FFIcons.kasset17,
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      size: 24,
                    ),
                  ),
                ),
                Text(
                  'Entrada exitosa',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Proxima nova',
                        color: FlutterFlowTheme.of(context).primaryText,
                        useGoogleFonts: false,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.tipoParametro,
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ],
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
