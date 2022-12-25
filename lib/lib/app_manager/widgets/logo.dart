import 'package:flutter/material.dart';


class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: const SizedBox(
          height: 150,
          width: 150,
          child: Image(image: AssetImage('assets/logo.png'),)),
    );
  }
}
