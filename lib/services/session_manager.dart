import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onyx_delivery/routes/routes.dart';

class SessionManager extends WidgetsBindingObserver {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  SessionManager._internal();

  Timer? _sessionTimer;
  final Duration _sessionTimeout = const Duration(minutes: 2);

  void start() {
    WidgetsBinding.instance.addObserver(this);
    _resetTimer();
  }

  void stop() {
    WidgetsBinding.instance.removeObserver(this);
    _sessionTimer?.cancel();
  }

  void _resetTimer() {
    _sessionTimer?.cancel();
    _sessionTimer = Timer(_sessionTimeout, _onSessionTimeout);
  }

  void _onSessionTimeout() {
    Get.offAllNamed(AppRoutes.login); // اذهب لشاشة تسجيل الدخول
  }

  void onUserInteraction() {
    _resetTimer();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // دخل للخلفية → نبدأ العداد
      _resetTimer();
    } else if (state == AppLifecycleState.resumed) {
      // رجع للتطبيق → نعيد ضبط العداد
      _resetTimer();
    }
  }
}
