import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class Customer {
  final int id;
  final String companyName;
  final String state;
  final String city;
  final String address;
  final String contact;
  final String email;

  Customer({
    required this.id,
    required this.companyName,
    required this.state,
    required this.city,
    required this.address,
    required this.contact,
    required this.email,
  });
}

class CustomerCSApp extends StatefulWidget {
  const CustomerCSApp({Key? key}) : super(key: key);

  @override
  _CustomerCSAppState createState() => _CustomerCSAppState();
}

class _CustomerCSAppState extends State<CustomerCSApp> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();

  List<Customer> _customers = [];
  PostgreSQLConnection? _connection;

  @override
  void initState() {
    super.initState();
    _connectToDatabase();
  }

  Future<void> _connectToDatabase() async {
    final connection = PostgreSQLConnection(
      'localhost',
      5432,
      'my_database',
      username: 'my_username',
      password: 'my_password',
    );

    await connection.open();

    setState(() {
      _connection = connection;
    });
  }

  Future<void> _insertCustomer() async {
    if (_formKey.currentState!.validate()) {
      final id = int.parse(_idController.text);
      final companyName = _companyNameController.text;
      final state = _stateController.text;
      final city = _cityController.text;
      final address = _addressController.text;
      final contact = _contactController.text;
      final email = _emailController.text;

      await _connection!.query(
        'INSERT INTO customer_cs (id, company_name, state, city, address, contact, email) VALUES (@id, @companyName, @state, @city, @address, @contact, @email)',
        substitutionValues: {
          'id': id,
          'companyName': companyName,
          'state': state,
          'city': city,
          'address': address,
          'contact': contact,
          'email': email,
        },
      );

      setState(() {
        _customers.add(
          Customer(
            id: id,
            companyName: companyName,
            state: state,
            city: city,
            address: address,
            contact: contact,
            email: email,
          ),
        );
      });

      _idController.clear();
      _companyNameController.clear();
      _stateController.clear();
      _cityController.clear();
      _addressController.clear();
      _contactController.clear();
      _emailController.clear();
    }
  }

  Future<void> _retrieveCustomers() async {
    final result = await _connection!.query('SELECT * FROM customer_cs');

    setState(() {
      _customers = result
          .map(
            (row) => Customer(
              id: row[0] as int,
              companyName: row[1] as String,
              state: row[2] as String,
              city: row[3] as String,
              address: row[4] as String,
              contact: row[5] as String,
              email: row[6] as String,
            ),
          )
          .toList();
    });
  }

} 
