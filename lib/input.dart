import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController();
  String? _errorMsg;
  bool _isEnabled = false;
  // String _name = '';
  @override
  void initState() {
    super.initState();
    _controller.addListener(validateInput);
  }

  void validateInput() {
    final text = _controller.text;
    _errorMsg = switch (text) {
      String name when name.isEmpty => 'Field name tidak boleh kosong',
      String name when name.length < 3 => 'Field name minimal 3 karakter',
      _ => null
    };
    setState(() {
      _isEnabled = _errorMsg == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Apps')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'John Doe',
                labelText: 'Name',
                errorText: _errorMsg,
              ),
              // onChanged: (String value) {
              //   setState(() {
              //     _name = value;
              //   });
              // },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isEnabled
                  ? () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text('Helo, ${_controller.text}'),
                        ),
                      );
                    }
                  : null,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
