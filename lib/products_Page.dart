import 'package:flutter/material.dart';
import 'Cart_page.dart';

class ProductsPage extends StatefulWidget{
  const ProductsPage({super.key});
  @override
  State<ProductsPage>createState() => _ProductsPageState();
}
class _ProductsPageState extends State<ProductsPage>{

  final PageController _pageController=PageController();
  int _pageIndex=0;
   final List<Map<String,String>>products=[
     {
       "name":"MakBook",
       "price":"900\$",
       "image":"https://m.media-amazon.com/images/I/61-oTP1X4rL._AC_SX679_.jpg",
     },
     {
       "name":"Wireless Headphones",
       "price":"300\$",
       "image":"https://m.media-amazon.com/images/I/61kFsU+CYkL.jpg",
     },
     {
       "name":"Smart Watch",
       "price":"500\$",
       "image":"https://m.media-amazon.com/images/I/61pIzNaNRWL._UF894,1000_QL80_.jpg",
     },
     {
       "name":"Designer Backpack",
       "price":"120\$",
       "image":"https://m.media-amazon.com/images/I/5184gJbdXLL._AC_SX679_.jpg",
     },
     {
       "name":"Premium Keyboard",
       "price":"200\$",
       "image":"https://assets-dubaiphone.dubaiphone.net/dp-prod/wp-content/uploads/2025/08/Lenovo-Legion-K310-RGB-Gaming-Keyboard-Arabic-GY41N91859_Keyboard-Mouse_23052_1.jpeg"
     },
     {
       "name":"Wireless Mouse",
       "price":"155\$",
       "image":"https://m.media-amazon.com/images/I/71kGRWy3YSL._AC_SX679_.jpg",
     },
   ];
  final List<Map<String, String>> hotOffers = [
    {
      "title": "Work smarter with style.",
      "image": "https://9to5mac.com/wp-content/uploads/sites/6/2021/10/MacBook-Pro-2021.jpg?quality=82&strip=all&w=1024", // MacBook
    },
    {
      "title": "Unplug and feel the beat.",
      "image": "https://tv-it.com/storage/nermeen-aladin/anker-soudecore-headphone/soundcore-headphone-p1-300x300.webp", // Wireless Headphones
    },
    {
      "title": "Your health on your wrist.",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrK4gzVVhsYYsFz0dYR_lE83Av1CnG9CA2SA&s", // Smart Watch
    },
    {
      "title": "Carry elegance everywhere.",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVip9RGZzcrfRFDnL8s-3v8Ff9F1AeBKWpgw&s", // Designer Backpack
    },
    {
      "title": "Type faster, shine brighter.",
      "image": "https://m.media-amazon.com/images/I/619XjVVmwrL.jpg", // Premium Keyboard
    },
    {
      "title": "Precision at your fingertips.",
      "image": "https://m.media-amazon.com/images/I/61N+CzcA8vL.jpg", // Wireless Mouse
    },
  ];
   final List<String>featured=[
     "https://www.webx360.com/wp-content/uploads/ecommerce-storefront-features.jpg",
     "https://cdn.shopify.com/s/files/1/0817/7988/4088/articles/6DaWtQPc3lNh5d7l5wAi97.png?v=1712946186",
     "https://wallpapers.com/images/hd/e-commerce-pictures-ybm2y9yd0mjsgx7h.jpg",
   ];
   final List<Map<String,String>>cartItems=[];
   @override
  void dispose(){
     _pageController.dispose();
     super.dispose();
   }
   void addToCart(Map<String,String>product){
     setState(() {
       cartItems.add(product);
     });
     ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
             content: Text("${product['name']}added to the cart"
             ),
         backgroundColor: Colors.purple,
         duration: const Duration(seconds: 2),
           behavior: SnackBarBehavior.floating,
           margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
         ),
     );
   }
   @override
  Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
         title: const Text("Our Products",
         style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
         backgroundColor: Colors.purple,
         actions: [

         ],
       ),
       body: SingleChildScrollView(
         child: Column(
           crossAxisAlignment:CrossAxisAlignment.start,
           children: [
             const SizedBox(height: 12,),
             Center(
               child: Text(
                 "Featured Products",
                 style: TextStyle(
                   fontSize: 22,
                   fontWeight: FontWeight.bold,
                   color: Colors.black,
                 ),
               ),
             ),
             const SizedBox(height: 12,),
             SizedBox(
               height: 200,
               child: PageView.builder(
                 controller: _pageController,
                 itemCount: featured.length,
                 onPageChanged: (index){
                   setState(() {
                     _pageIndex = index;
                   });
                 },
                 itemBuilder: (context,i){
                   return Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 20,),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(12),
                       child: Image.network(
                         featured[i],
                         fit: BoxFit.cover,
                           width: double.infinity,
                         loadingBuilder: (ctx,child,prog){
                           if (prog==null)return child;
                           return Container(
                             color: Colors.grey[200],
                             child:const Center(
                               child: CircularProgressIndicator()),

                           );
                         },
                         errorBuilder: (_,__,___)=>Container(
                           color: Colors.grey[200],
                           child: const Center(
                             child: Icon(Icons.broken_image),
                           ),
                         ),
                       ),
                     ),
                   );
                 },
               ),
             ),

             const SizedBox(height: 12,),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: List.generate(
                   featured.length,(i)=>AnimatedContainer(
                   duration: const Duration(
                     milliseconds: 250),
                   margin: const EdgeInsets.symmetric(horizontal: 5),
                 width: _pageIndex==i?14:10,
                 height:_pageIndex==i?14:10,
                 decoration: BoxDecoration(
                     color: _pageIndex==i?Colors.blue:Colors.grey,
                     shape: BoxShape.circle
                 ),
               ),
               ),
             ),
             const SizedBox(height: 18,),

             const Padding(
                 padding:EdgeInsets.symmetric(horizontal: 16),
               child: Text(
                 "Shop Our Collection",
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
             const SizedBox(height: 12,),
             GridView.builder(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               padding: const EdgeInsets.symmetric(horizontal: 12),
               itemCount: products.length,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 mainAxisSpacing: 12,
                 crossAxisSpacing: 12,
                 childAspectRatio: 0.78,
               ),
               itemBuilder: (context,index){
                 final p=products[index];
                 return Card(
                   elevation: 3,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: Stack(
                     children: [
                       Column(
                         children: [
                           const SizedBox(height: 8,),
                           Expanded(child: Padding(padding:
                               const EdgeInsets.symmetric(horizontal: 8),
                             child: Image.network(
                               p['image']!,
                               fit: BoxFit.contain,
                               width: double.infinity,
                             ),
                           ),
                           ),
                         const SizedBox(height: 8,),
                           Text(
                             p['name']!,
                             style:  TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 16,
                             ),
                           ),
                         const SizedBox(height: 6,),
                           Text(
                             p['price']!,
                             style: TextStyle(
                               color: Colors.purple,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                           const SizedBox(height: 6,),
                         ],
                       ),
                       Positioned(
                         right: 6,
                         top: 6,
                         child: InkWell(
                           onTap: ()=> addToCart(p),
                           borderRadius: BorderRadius.circular(18),
                           child: Container(
                             padding: const EdgeInsets.all(6),
                             decoration: BoxDecoration(
                               color: Colors.white70,
                               borderRadius: BorderRadius.circular(12),
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.black12,
                                   blurRadius: 4,
                                 )
                               ],
                             ),
                             child: const Icon(Icons.add_shopping_cart,color: Colors.blue,),
                           ),
                         ),
                       ),
                     ],
                   ),
                 );
               },
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
               child: Row(
                 children: const [
                   Text(
                     "Hot Offers ",
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   Text(
                     "🔥",
                     style: TextStyle(fontSize: 20),
                   ),
                 ],
               ),
             ),
             ListView.builder(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               itemCount: hotOffers.length,
               itemBuilder: (context, index) {
                 final offer = hotOffers[index];
                 return Container(
                   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                   padding: const EdgeInsets.all(12),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(12),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black12,
                         blurRadius: 4,
                       ),
                     ],
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: Text(
                           offer["title"]!,
                           style: const TextStyle(fontSize: 16),
                         ),
                       ),
                       const SizedBox(width: 12),
                       ClipRRect(
                         borderRadius: BorderRadius.circular(8),
                         child: Image.network(
                           offer["image"]!,
                           width: 60,
                           height: 60,
                           fit: BoxFit.cover,
                         ),
                       ),
                     ],
                   ),
                 );
               },
             ),
             const SizedBox(height: 24,),
           ],
         ),
       ),
floatingActionButton: FloatingActionButton(
  backgroundColor: Colors.purple,
  onPressed: (){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=>
            CartPage(cartItems:cartItems),
    ),
    );
  },
child: const Icon(Icons.shopping_cart),
),
     );
   }
}
