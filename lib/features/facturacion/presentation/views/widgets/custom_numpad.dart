import 'package:flutter/material.dart';

class CustomNumpad extends StatelessWidget {
  final Function(String) onKeyPressed;
  final VoidCallback onBackspace;
  final VoidCallback onClear;

  const CustomNumpad({
    super.key,
    required this.onKeyPressed,
    required this.onBackspace,
    required this.onClear,
  });

  Widget _buildNumButton(BuildContext context, String text) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        height: 72,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E293B), // Dark slate
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: const BorderSide(color: Color(0xFF334155), width: 1.5),
            ),
          ),
          onPressed: () => onKeyPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, Widget child, VoidCallback onPressed, {Color? color}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        height: 72,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? const Color(0xFF334155), // Lighter slate
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // Slate 900
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF1E293B), width: 2),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _buildNumButton(context, '1'),
              _buildNumButton(context, '2'),
              _buildNumButton(context, '3'),
            ],
          ),
          Row(
            children: [
              _buildNumButton(context, '4'),
              _buildNumButton(context, '5'),
              _buildNumButton(context, '6'),
            ],
          ),
          Row(
            children: [
              _buildNumButton(context, '7'),
              _buildNumButton(context, '8'),
              _buildNumButton(context, '9'),
            ],
          ),
          Row(
            children: [
              _buildActionButton(
                context,
                const Text(
                  'BORRAR',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFFF43F5E)), // Rose 500
                ),
                onClear,
              ),
              _buildNumButton(context, '0'),
              _buildActionButton(
                context,
                const Icon(Icons.backspace_outlined, size: 26, color: Colors.white),
                onBackspace,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
