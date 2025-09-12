import 'package:e_commerce/signin_page.dart';
import 'package:e_commerce/signup_page.dart';
import 'package:flutter/material.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('ShopCraft',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.deepPurple,
    ),
    body:SizedBox.expand(
    child:Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
          colors: [Colors.deepPurple,Colors.deepPurpleAccent]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Your Premium Shopping Experience",
            style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
          ),
          ),
          const SizedBox(height: 60,),
          Row(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              ClipRRect(borderRadius:
          BorderRadius.circular(12),
        child:Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyJzeqgkW2T-T9Wsm1BBtfKt0Xim-J-PgbEA&s",
          width:150,
          height:150,
          fit:BoxFit.cover,),
    ),
      const SizedBox(width: 20,),
              ClipRRect(borderRadius:
              BorderRadius.circular(12),
              child: Image.network("https://images.unsplash.com/photo-1542831371-29b0f74f9713?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cHJvZ3JhbW1lcnxlbnwwfHwwfHx8MA%3D%3D",
              width: 150,
              height: 150,
                fit: BoxFit.cover,
              ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const SignUpPage()),);

              },
              child: const Text("<Sign Up>"),
              ),

              const SizedBox(width: 25,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const SignInPage()),);
                },
                child: const Text("<Sign In>"),
              ),

            ],

          )



        ],
      ),
    ) ,
    )
    );
  }
}
