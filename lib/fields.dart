import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NamePage extends StatefulWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String _selectedCountryCode = '+1'; // default country code is +1

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:
       Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueGrey[200] ?? Colors.grey,
  Colors.grey[100] ?? Colors.white,

            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
         //child: //SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                child: 
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                            'Customer Details:',
                          style: TextStyle(
                          fontSize: 20, // set font size
                          fontWeight: FontWeight.bold, // set font weight
                          fontStyle: FontStyle.normal, // set font style
                        color: Colors.black87, // set font color
                        ),
                        textAlign: TextAlign.justify, // set horizontal alignment
                        textDirection: TextDirection.ltr,
                ),
                ],
                ),
       
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
       
                        
                   Expanded(
                      child: _buildTextField(
                        controller: _firstNameController,
                        label: 'First Name',
                      ),
                    ),
                    Expanded(
                      child: _buildTextField(
                        controller: _middleNameController,
                        label: 'Middle Name',
                      ),
                    ),
                    Expanded(
                      child: _buildTextField(
                        controller: _lastNameController,
                        label: 'Last Name',
                      ),
                    ), 
                  ],
                ),

                
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: DropdownButtonFormField<String>(
                            value: _selectedCountryCode,
                            onChanged: (value) {
                              setState(() {
                                _selectedCountryCode = value!;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Code',
                              labelStyle: TextStyle(color: Colors.black54),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: '+1',
                                child: Text(
                                  '+1',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: '+91',
                                child: Text(
                                  '+91',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: '+44',
                                child: Text(
                                  '+44',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: _buildTextField(
                            controller: _phoneController,
                            label: 'Phone',
                          ),
                        ),
                        
                      ],
                    ),
                    Row(children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _middleNameController,
                        label: 'Pin Code',
                      ),
                    ),],),
                    Row(children: [Expanded(
                      child: _buildTextField(
                        controller: _middleNameController,
                        label: 'Address:',
                      ),),],)
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
              ),
            ],
          ),
             //),
       ),
    );
  }

Widget _buildTextField({
  required TextEditingController controller,
  required String label,

  List<TextInputFormatter>? inputFormatters,
  Widget? prefix,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child:
     TextField(
      controller: controller,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(

        labelText: label,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        prefix: prefix,
      ),
    ),
  );
}


}