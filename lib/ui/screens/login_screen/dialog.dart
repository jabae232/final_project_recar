import 'package:flutter/material.dart';

class AlterDialog extends StatelessWidget {
  const AlterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Ошибка',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      content: const Text(
        'Неправильный пароль или логин',
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 24),
      actions: <Widget>[
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(
                          width: 2, color: Colors.white),
                    ),
                  ),
                ),
                child: const Text(
                  "Закрыть"
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}