import 'package:flutter/material.dart';
import 'package:nish_hair/provider/auth.dart';
import 'package:provider/provider.dart';
import 'sign_up.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Auth p = Provider.of<Auth>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/Logo.png',
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 320),
              child: Container(
                height: 480,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5.0, 5.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: const [
                        Center(
                          child: Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Sign in to continue",
                            style: TextStyle(
                              color: Color(0xff98E1F2),
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Consumer<Auth>(
                      builder: (context, auth, child) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: false,
                                  hintText: "Email",
                                  filled: true,
                                  fillColor: Color(0xffE5E5E5),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18.0, left: 18, right: 18, bottom: 12),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: p.e ? false : true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: false,
                                  hintText: "Password",
                                  filled: true,
                                  fillColor: const Color(0xffE5E5E5),
                                  // labelText: "Login",

                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                      onPressed: p.eye,
                                      icon: p.e
                                          ? const Icon(Icons.remove_red_eye)
                                          : const Icon(
                                              Icons.remove_red_eye_outlined))),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 17,
                        ),
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            p.signUser(
                                _emailController, _passwordController, context);
                          },
                          child: Container(
                              height: 46,
                              width: 260,
                              decoration: const BoxDecoration(
                                  color: Color(0xff98E1F2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                  child: Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 48,
                            ),
                            const Text(
                              "Does not have an account? ",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => SignUp())),
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Color(0xff98E1F2), fontSize: 14),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
