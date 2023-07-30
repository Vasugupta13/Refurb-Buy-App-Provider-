import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobilicis/src/Service/SearchService.dart';
import 'package:mobilicis/src/Utils/Consts/consts.dart';
import 'package:mobilicis/src/model/SearchModel.dart';
import 'package:provider/provider.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final TextEditingController _search = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchService>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.fromLTRB(8, 5, 8, 0)
          ,child:
             Column(
               children: [
                 Container(
                   height: 50,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                     color: kAppBarColor,
                   ),
                   child: Padding(
                     padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
                     child: TextFormField(
                       controller: searchProvider.searchController,
                       onChanged: (value){
                         searchProvider.onChange(context, value);
                       },
                       cursorColor: Colors.black,
                       decoration: InputDecoration(
                         suffixIcon: InkWell(
                             onTap: (){ Navigator.pop(context);},
                             child: kCancelIcon ),

                         suffixIconConstraints: const BoxConstraints(
                             minHeight: 20,
                             minWidth: 30
                         ),
                         prefixIcon: kSearchIcon,
                         prefixIconConstraints: const BoxConstraints(
                             minHeight: 20,
                             minWidth: 30
                         ),
                         filled: true,
                         fillColor: Colors.white,
                         hintText: "Search with make and model...",
                         isCollapsed: true,
                         contentPadding: const EdgeInsets.all(10),
                         enabledBorder: OutlineInputBorder(
                           borderSide: const BorderSide(color: Colors.white,width: 0),
                           borderRadius: BorderRadius.circular(5),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(color: Colors.white,width: 0),
                           borderRadius: BorderRadius.circular(5),
                         ),
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 400,
                   width: double.infinity,
                   child: FutureBuilder<SearchModel>(
                     future: SearchService().showResults(searchProvider.searchController.text),
                     builder: (context,snapshot){
                       if (snapshot.connectionState == ConnectionState.waiting) {
                         return const Center(child: CircularProgressIndicator());
                       }else if (snapshot.hasError) {
                         return Center(child: Text('Error: ${snapshot.error}'));
                       }else{
                         return Padding(
                           padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Brand Name',style: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w500),),
                               ConstrainedBox(constraints: const BoxConstraints(minHeight: 0,maxHeight: 200),
                                 child: ListView.builder(
                                     physics: const NeverScrollableScrollPhysics(),
                                   shrinkWrap: true,
                                     itemCount: snapshot.data?.makes?.length ?? 0,
                                     itemBuilder: (context,index){
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Text(snapshot.data?.makes?[index] ??'Not Available',style: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),
                                          ),
                                        ],
                                      );
                                 }),
                               ),
                               const SizedBox(height: 20,),
                               Text('Mobile Models',style: TextStyle(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w500),),
                               Expanded(
                                 child: ListView.builder(
                                   physics: const NeverScrollableScrollPhysics(),
                                     itemCount: snapshot.data?.models?.length ?? 0,
                                     itemBuilder: (context,index){
                                       return Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only(top: 15),
                                             child: Text(snapshot.data?.models?[index]??'Not Available',style: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),
                                           ),
                                         ],
                                       );
                                     }),
                               ),
                             ],
                           ),
                         );
                       }
                     },
                   ),
                 )


               ],
             ),

        ),
      ),
    );
  }
}
