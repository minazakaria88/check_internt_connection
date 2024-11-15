import 'package:check_internet_connection/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'internet_connection_cubit/internet_cubit.dart';
import 'internet_connection_cubit/internet_state.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const CheckInternetConnection());
}

class CheckInternetConnection extends StatelessWidget {
  const CheckInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit()..checkInternetConnection(),
      child: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigatorService.navigatorKey,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Check Internet Connection'),
            ),
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Builder(builder: (context) {
                    return Container(
                      margin: const EdgeInsets.all(50),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF3562D3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ]),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SecondScreen(),
                          ));
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigatorService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
