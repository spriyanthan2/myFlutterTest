import 'package:omobiofluttertest/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register>
    implements AuthStateListener {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password,_cpassword;
  bool _obscureText = true;
  bool _obscureText1 = true;

  _RegisterState() {
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _submit() {
    final form = formKey.currentState;
      _showSnackBar("Have no validations");
    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        savePref(_username);
        var authStateProvider = new AuthStateProvider();
        authStateProvider.notify(AuthState.LOGGED_IN);
        authStateProvider.dispose(this);
      });
    }
    else{
      _showSnackBar("Invalid credentials");
    }
  }

  savePref(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt('id', 1);
      preferences.setString("username", username);
    });
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;

    return new Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomPadding: true,
        body: new Padding(
          padding: EdgeInsets.all(10),
          child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
//                      email
                Container(
                  child: Column(
                    children: [
                      new Padding(
                        padding: EdgeInsets.all(1.0),
                        child: TextFormField(
                          onSaved: (val) => _username = val,
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(27.0),
                            ),
                            labelText: 'Email',
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                      ),
                      new SizedBox(height: 20),
//                      password
                      new Padding(
                        padding: EdgeInsets.all(1.0),
                        child: TextFormField(
                          onSaved: (val) => _password = val,
                          obscureText: _obscureText,
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(27.0)),
                            labelText: 'Password',
                            suffixIcon: InkWell(
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.only(end: 12.0),
                                child: _obscureText
                                    ? const Icon(Icons.lock)
                                    : const Icon(Icons
                                    .lock_open), // myIcon is a 48px-wide widget.
                              ),
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                      ),
//
                      new SizedBox(height: 20),
//                      password
                      new Padding(
                        padding: EdgeInsets.all(1.0),
                        child: TextFormField(
                          onSaved: (val) => _cpassword = val,
                          obscureText: _obscureText1,
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(27.0)),
                            labelText: 'Confirm Password',
                            suffixIcon: InkWell(
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.only(end: 12.0),
                                child: _obscureText1
                                    ? const Icon(Icons.lock)
                                    : const Icon(Icons
                                    .lock_open), // myIcon is a 48px-wide widget.
                              ),
                              onTap: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                            ),
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 10,
                  height: 4,
                  color: Colors.blue,
                ),

                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 500,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: new FlatButton(
                        onPressed: _submit,
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(height: 20),
                    Container(
                      width: 500,
                      height: 50,
                      child: new FlatButton(
                        onPressed: (){
                          Navigator.of(_ctx).pushReplacementNamed("/login");
                        },
                        child: Text('Login',style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                        ),),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.blue, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void onAuthStateChanged(AuthState state) {
    if (state == AuthState.LOGGED_IN) {
      Navigator.of(_ctx).pushReplacementNamed("/home");
    } else if (state == AuthState.LOGGED_OUT)
      Navigator.of(_ctx).pushReplacementNamed("/login");
  }
}
