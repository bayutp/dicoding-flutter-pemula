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
  bool _isMerried = false;
  String? language;
  final List<String> skills = ['Backend', 'Front End', 'Mobile'];
  final Map<String, bool> skillSelected = {
    'Backend': false,
    'Front End': false,
    'Mobile': false,
  };
  // String _name = '';
  @override
  void initState() {
    super.initState();
    _controller.addListener(validateInput);
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
            Switch(
              value: _isMerried,
              onChanged: (bool value) {
                setState(() {
                  _isMerried = value;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_isMerried ? 'Menikah' : 'Single'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Column(
              children: ['Java', 'Kotlin', 'Dart']
                  .map(
                    (String lang) => RadioListTile<String>(
                      value: lang,
                      groupValue: language,
                      onChanged: (String? value) {
                        setState(() {
                          language = value;
                          showSnackBar();
                        });
                      },
                      title: Text(lang),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 20),
            Column(
              children: skills.map((String s) {
                return CheckboxListTile(
                  value: skillSelected[s],
                  onChanged: (bool? value) {
                    setState(() {
                      skillSelected[s] = value ?? false;
                    });
                  },
                  title: Text(s),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isEnabled
                  ? () {
                      final selectedOnly = skillSelected.entries
                          .where((entry) => entry.value == true)
                          .map((entry) => entry.key)
                          .toList();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(
                            'Helo, ${_controller.text}\nStatus: ${_isMerried ? 'Menikah' : 'Single'}\nFavorit: $language\nSkills: ${selectedOnly.join(', ')}',
                          ),
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

  void validateInput() {
    final text = _controller.text;
    _errorMsg = switch (text) {
      // guard clause
      String name when name.isEmpty => 'Field name tidak boleh kosong',
      String name when name.length < 3 => 'Field name minimal 3 karakter',
      _ => null,
    };
    setState(() {
      _isEnabled = _errorMsg == null;
    });
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
