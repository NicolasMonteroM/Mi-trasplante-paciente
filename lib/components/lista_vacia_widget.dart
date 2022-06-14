import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ListaVaciaWidget extends StatefulWidget {
  const ListaVaciaWidget({
    Key key,
    this.info,
  }) : super(key: key);

  final String info;

  @override
  _ListaVaciaWidgetState createState() => _ListaVaciaWidgetState();
}

class _ListaVaciaWidgetState extends State<ListaVaciaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(),
              child: Image.asset(
                'assets/images/empty.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            widget.info,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Proxima nova',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  useGoogleFonts: false,
                ),
          ),
        ],
      ),
    );
  }
}
