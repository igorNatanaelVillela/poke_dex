import 'package:flutter/material.dart';
import 'package:poke_dex/controller/acess_controller.dart';
import 'package:poke_dex/view/welcome_page.dart';

AppBar appBar() {
  return AppBar(
    title: const Text('PodeDex'),
    backgroundColor: Color.fromARGB(255, 228, 104, 104),
    actions: [
      PopupMenuButton(
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'Sair',
            child: const Text('Sair'),
            onTap: () async {
              final navigator = Navigator.of(context);
              bool logout = await AcessController.instance.logout();
              if (logout) {
                navigator.pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const WelcomePage(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    ],
  );
}
