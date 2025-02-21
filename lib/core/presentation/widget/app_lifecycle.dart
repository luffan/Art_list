import 'package:art_list/di/modules/configure_dependencies.dart';
import 'package:flutter/material.dart';

/// Widget necessary for tracking the life cycle of an application
///
/// Recycles classes injected via [Injector] when the application shuts down
///
class AppLifecycle extends StatefulWidget {
  final Widget child;

  const AppLifecycle({super.key, required this.child});

  @override
  State<AppLifecycle> createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onStateChange: _onStateChanged,
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        _onDetached();
        break;
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
    }
  }

  void _onDetached() {
    Injector.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
