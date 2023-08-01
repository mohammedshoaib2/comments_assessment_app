import 'package:comments_assessment_app/constants/global_variables.dart';
import 'package:comments_assessment_app/features/auth/screens/auth_screen.dart';
import 'package:comments_assessment_app/features/comments/screens/comments_screen.dart';
import 'package:comments_assessment_app/firebase_options.dart';
import 'package:comments_assessment_app/providers/comment_provider.dart';
import 'package:comments_assessment_app/providers/remote_config_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CommentProvider>(
          create: (context) {
            return CommentProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return RemoteConfigProvider();
          },
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Comments App',
              theme: ThemeData(
                  scaffoldBackgroundColor: GlobalVariables.kBackgroundColor),
              home: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const CommentsScreen();
                  }
                  return const AuthScreen();
                },
              ),
            );
          }),
    );
  }
}
