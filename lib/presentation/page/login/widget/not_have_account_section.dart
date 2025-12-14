import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';

class NotHaveAccountSection extends StatelessWidget {
  const NotHaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: S.of(context).dontHaveAnAccount,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey[500],
        ),
        children: [
          const WidgetSpan(
            child: SizedBox(width: 5),
          ),
          TextSpan(
            text: S.of(context).signUp,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.push(AppRoutes.registerPage),
          ),
        ],
      ),
    );
  }
}
