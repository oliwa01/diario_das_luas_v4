import 'package:diario_das_luas/pages/principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:url_launcher/url_launcher.dart';

class Slideshow extends StatefulWidget {
  String nome;
  String email;
  Slideshow(this.nome,this.email);
  @override
  _SlideshowState createState() => _SlideshowState();
}

class _SlideshowState extends State<Slideshow> {


  _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: (Image.asset("assets/images/logo.png",
                width: 160, height: 100)),

            leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Principal(widget.nome, widget.email)));
                },
                child: Icon(
                  Icons.arrow_back, size: 30, // add custom icons also
                ))),
        body: ImageSlideshow(

          /// Width of the [ImageSlideshow].
          width: widthlua,

          /// Height of the [ImageSlideshow].
          height: heightlua,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: Colors.blue,

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.deepOrange,

          /// The widgets to display in the [ImageSlideshow].
          children: [
            SizedBox(
              width: widthlua,
              height: heightlua,
              child: RaisedButton(
                  child: Image.asset('assets/images/amb-01.jpg', fit: BoxFit.contain,),
                  color: Colors.black,
                  onPressed: () {
                    _launchInBrowser("https://loja.nomundodasluas.com.br");
                  }
              )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-02.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-03.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-04.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-05.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-06.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-07.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-08.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-09.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-11.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-12.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-13.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-14.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-15.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-16.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-17.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-18.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-19.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-20.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-21.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-22.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-23.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-24.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-25.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-26.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-27.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-28.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-29.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-30.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-30.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-31.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-32.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-33.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-34.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-35.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-35.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-37.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-38.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-39.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-40.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),
            SizedBox(
                width: widthlua,
                height: heightlua,
                child: RaisedButton(
                    child: Image.asset('assets/images/amb-41.jpg', fit: BoxFit.contain,),
                    color: Colors.black,
                    onPressed: () {
                      _launchInBrowser("https://loja.nomundodasluas.com.br");
                    }
                )
            ),

          ],
        ),
      ),
    );
  }
}