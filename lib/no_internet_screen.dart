import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff871844),
          title: const Text(
            'Offline',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          automaticallyImplyLeading: false,
          leading: null,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: Image.asset('assets/offline.gif',fit: BoxFit.fill,),
            ),
            const Text(
              'No Internet Connection',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
