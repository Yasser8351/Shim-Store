import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';
import '/model_class/config.dart';
import '/widget/Border_Button_Custom.dart';

import '../complet_send.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> with TickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _textController = TextEditingController();
  bool _isLoading = false;

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  sendEmail() async {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _textController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Text('جميع الحقول مطلوبة'),
      ));
    } else {
      String data =
          '<html><body><style>table, th, td {border: 1px solid black;border-collapse: collapse;}</style><table style="width:100%"><tr><th>${_nameController.text}</th> <th>اسم المستخدم</th></tr><tr><th>${_emailController.text}</th> <th>الايميل</th></tr><tr><th>${_textController.text}</th> <th>النص</th></tr></table></body></html>';
      setState(() {
        _isLoading = true;
      });

      String username = "sender@gulfsmo.net";
      String password = "-zxu[vtQ.pU(";
      final smtpServer = new SmtpServer("mail.gulfsmo.net",
          username: username, password: password, port: 465, ssl: true);

      final message = Message()
        ..from = Address(username, _emailController.text)
        ..recipients.add('yasser8351@gmail.com')
        // ..recipients.add(Config.email)
        ..subject = 'طلب تواصل'
        ..text = data
        ..html = data;

      try {
        await send(message, smtpServer);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => CompletSend())));
      } on MailerException {
        setState(() {
          _isLoading = false;
        });
        //notsendemail
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content: Text('حدث خطأ لم يتم ارسال الايميل'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Contact Us'),
      //   backgroundColor: const Color(0xFF000202),
      // ),
      body: ListView(children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 200,
              ),
              Text(
                Config.appname_ar,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  Config.Discrptions,
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              BorderButtonCustom(
                title: 'البريد الالكتروني',
                backgroundColor: Colors.transparent,
                foregroundColor: Theme.of(context).colorScheme.primary,
                borderColor: Colors.black,
                color: Theme.of(context).colorScheme.primary,
                icon: Icons.email,
                onTap: () {
                  launch('mailto:${Config.email}');
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTextfield(
                      // colorScheme: Colors.grey,
                      label: 'الاسم',
                      controller: _nameController,
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    _buildTextfield(
                      // colorScheme: colorScheme,
                      label: 'البريد الالكتروني',
                      controller: _emailController,
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    _buildTextfield(
                      // colorScheme: colorScheme,
                      label: 'النص',
                      controller: _textController,
                      obscure: false,
                    ),
                    BorderButtonCustom(
                      title: 'ارسال',
                      backgroundColor: Colors.transparent,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      borderColor: Color.fromARGB(255, 125, 96, 96),
                      color: Theme.of(context).colorScheme.primary,
                      icon: Icons.send,
                      onTap: () {
                        sendEmail();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              if (Config.CopyRightStutas)
                GestureDetector(
                  onTap: () {
                    launch('https://www.themsc.net');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.only(left: 15),
                    // decoration: BoxDecoration(
                    //   color: Theme.of(context).colorScheme.secondary,
                    //   // borderRadius: BorderRadius.circular(125),
                    // ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/msclogo.png',
                          height: 80,
                          width: 80,
                        ),
                        Text(
                          'تم التطوير بواسطة شركة MSC',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ]),
    );
  }
}

_buildTextfield({
  // required ColorScheme colorScheme,
  required TextEditingController controller,
  required String label,
  required bool obscure,
}) {
  return Material(
    elevation: 3,
    shadowColor: Colors.white30,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: TextField(
        textDirection: TextDirection.ltr,
        keyboardType: TextInputType.text,
        obscureText: obscure,
        // maxLength: 20,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(fontSize: 15, color: Color(0xffc8c8c8)),
          counterText: '',
        ),
        controller: controller,
      ),
    ),
  );
}
