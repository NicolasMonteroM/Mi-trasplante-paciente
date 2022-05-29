import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/Splash.png',
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Onboarding': (data) async => OnboardingWidget(),
  'Iniciar_sesion': (data) async => IniciarSesionWidget(),
  'Crear_cuenta': (data) async => CrearCuentaWidget(),
  'Completar_registro': (data) async => CompletarRegistroWidget(),
  'Seleccion_etapa': (data) async => SeleccionEtapaWidget(),
  'Resumen_registro': (data) async => ResumenRegistroWidget(),
  'Buscar': (data) async => BuscarWidget(),
  'Agenda': (data) async => NavBarPage(initialPage: 'Agenda'),
  'Indicadores': (data) async => NavBarPage(initialPage: 'Indicadores'),
  'Perfil': (data) async => NavBarPage(initialPage: 'Perfil'),
  'Peso_corporal': (data) async => PesoCorporalWidget(),
  'Contenido_ref': (data) async => ContenidoRefWidget(),
  'Contenidos': (data) async => NavBarPage(initialPage: 'Contenidos'),
  'Nuevo_medicamento': (data) async => NuevoMedicamentoWidget(),
  'Nuevo_medicamento_2': (data) async => NuevoMedicamento2Widget(
        nombreParametro: getParameter(data, 'nombreParametro'),
        concentracionParametro: getParameter(data, 'concentracionParametro'),
      ),
  'Nuevo_medicamento_3': (data) async => NuevoMedicamento3Widget(
        horaParametro: getParameter(data, 'horaParametro'),
        dosisParametro: getParameter(data, 'dosisParametro'),
        repeticionesParametro: getParameter(data, 'repeticionesParametro'),
        finalizacionParametro: getParameter(data, 'finalizacionParametro'),
        inicioParametro: getParameter(data, 'inicioParametro'),
        presentacionParametro: getParameter(data, 'presentacionParametro'),
        nombreParametro: getParameter(data, 'nombreParametro'),
        concentracionParametro: getParameter(data, 'concentracionParametro'),
        repeticionesP2: getParameter(data, 'repeticionesP2'),
      ),
  'Nuevo_medicamento_4': (data) async => NuevoMedicamento4Widget(
        nombreParametro: getParameter(data, 'nombreParametro'),
        concentracionParametro: getParameter(data, 'concentracionParametro'),
        inicioParametro: getParameter(data, 'inicioParametro'),
        finalizacionParametro: getParameter(data, 'finalizacionParametro'),
        dosisParametro: getParameter(data, 'dosisParametro'),
        repeticionesParametro: getParameter(data, 'repeticionesParametro'),
        horaParametro: getParameter(data, 'horaParametro'),
        presentacionParametro: getParameter(data, 'presentacionParametro'),
        repeticionesP2: getParameter(data, 'repeticionesP2'),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
