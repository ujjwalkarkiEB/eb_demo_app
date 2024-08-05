// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:local_session_timeout/local_session_timeout.dart';
// import 'package:eb_demo_app/src/features/authentication/presentation/blocs/session/session_bloc.dart';

// class SessionManager extends StatefulWidget {
//   final Widget child;

//   const SessionManager({required this.child, super.key});

//   @override
//   _SessionManagerState createState() => _SessionManagerState();
// }

// class _SessionManagerState extends State<SessionManager> with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       context.read<SessionBloc>().add(AppResumed());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         context.read<SessionBloc>().add(UserInteraction());
//       },
//       child: widget.child,
//     );
//   }
// }
