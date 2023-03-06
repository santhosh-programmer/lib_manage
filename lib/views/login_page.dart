import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/views/home_page.dart';
import 'package:lib_management/views/widgets/mail_textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool p = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  TextEditingController mail = TextEditingController(text: "210701@gmail.com");
  TextEditingController password = TextEditingController(text: "Changeme@123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 100, 20, 20),
              child: Container(
                height: getSize(context, 90),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple[100],
                ),
                child: const Center(
                  child: Text(
                    'College logo with name',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: getSize(context, 30),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '" There is no friend as loyal \nas a book "',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getSize(context, 30),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MailField(controller: mail),
                            SizedBox(
                              height: getSize(context, 35),
                            ),
                            TextFormField(
                              controller: password,
                              style: const TextStyle(color: Colors.white),
                              obscureText: p,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Enter Password',
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.white54), //<-- SEE HERE
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 4,
                                      color: Colors.white54), //<-- SEE HERE
                                ),
                                border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                hintText: 'Enter your Password',
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.white,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (p == false) {
                                          p = true;
                                        } else {
                                          p = false;
                                        }
                                        if (using == openeye) {
                                          using = closeeye;
                                        } else {
                                          using = openeye;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      using,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: getSize(context, 45),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: getSize(context, 54),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all(
                                        const StadiumBorder())),
                                onPressed: () {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(mail.text);
                                  if (mail.text == '' || password.text == '') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                        "Fill all the fields properly",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      backgroundColor: Colors.white,
                                    ));
                                  } else {
                                    if (emailValid == true) {
                                      try {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()),
                                          (Route<dynamic> route) => false,
                                        );
                                      } on Exception catch (e) {
                                        print(e);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            e.toString(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                          backgroundColor: Colors.white,
                                        ));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                          "Enter a valid Mail-Id",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        backgroundColor: Colors.white,
                                      ));
                                    }
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getSize(context, 45),
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
