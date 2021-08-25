import 'package:adam_podkowinski/core/settings_provider.dart';
import 'package:adam_podkowinski/core/styles.dart';
import 'package:adam_podkowinski/projects/presentation/pages/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
    return ScreenUtilInit(
      builder: () => ChangeNotifierProvider<SettingsProvider>(
        create: (context) {
          return SettingsProvider();
        },
        builder: (context, _) {
          return AnimationConfiguration.synchronized(
            duration: const Duration(seconds: 1),
            child: MaterialApp(
              title: 'Adam Podkowiński',
              themeMode: context.watch<SettingsProvider>().themeMode,
              theme: CustomTheme.buildLight(context),
              darkTheme: CustomTheme.buildDark(context),
              initialRoute: '/',
              routes: {
                '/': (context) => HomePage(),
                '/projects': (context) => ProjectsPage(),
              },
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          name: 'Home',
        ),
        body: FadeInAnimation(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello in my portfolio',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/projects');
                  },
                  child: const Text('Go To Projects'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsProvider>();
    return AppBar(
      backwardsCompatibility: false,
      title: Row(
        children: [
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Text(name),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(
            width: 10.w,
          ),
          Icon(
            Icons.dark_mode,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          Switch(
            thumbColor: MaterialStateProperty.all(
              Theme.of(context).primaryColor,
            ),
            trackColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.5)),
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) {
              state.changeTheme(
                value ? ThemeMode.dark : ThemeMode.light,
              );
            },
          ),
        ],
      ),
      actions: MediaQuery.of(context).orientation == Orientation.landscape
          ? [
              Center(
                child: OutlinedButton(
                  child: Text('Home'),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Center(
                child: OutlinedButton(
                  child: Text('Projects'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/projects');
                  },
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Center(
                child: OutlinedButton(
                  child: Text('Contact'),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ]
          : [
              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
