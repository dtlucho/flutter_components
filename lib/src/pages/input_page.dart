import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  String _selectedOption = 'Super speed';

  final List<String> _powers = [
    'Fly',
    'X-Ray',
    'Seuper strength',
    'Super speed',
  ];

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text inputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        children: [
          _createInput(),
          const Divider(),
          _createEmail(),
          const Divider(),
          _createPassword(),
          const Divider(),
          _createDate(),
          const Divider(),
          _createDropdown(),
          const Divider(),
          _createUser(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letters ${_name.length}'),
        hintText: 'First name',
        labelText: 'Name',
        helperText: 'Only the name',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createUser() {
    return ListTile(
      title: Text('Name is: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Power: $_selectedOption'),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'User email',
        labelText: 'Email',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
      ),
      onChanged: (value) => setState(() {
        _email = value;
      }),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'User password',
        labelText: 'Password',
        suffixIcon: const Icon(Icons.lock_open),
        icon: const Icon(Icons.lock),
      ),
      onChanged: (value) => setState(() {
        _password = value;
      }),
    );
  }

  Widget _createDate() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _dateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Birth date',
        labelText: 'Birth date',
        suffixIcon: const Icon(Icons.perm_contact_calendar),
        icon: const Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      locale: const Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _dateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List<DropdownMenuItem<String>> list = [];

    for (var power in _powers) {
      list.add(
        DropdownMenuItem(
          child: Text(power),
          value: power,
        ),
      );
    }

    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: [
        const Icon(Icons.select_all),
        const SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _selectedOption,
            items: getDropdownOptions(),
            onChanged: (String? selected) {
              if (selected != null) {
                _selectedOption = selected;
              }
            },
          ),
        ),
      ],
    );
  }
}
