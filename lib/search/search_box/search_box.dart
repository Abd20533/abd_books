// import 'package:culturalspacelibrary/helper_with_dio/cash_helper.dart';
// import 'package:culturalspacelibrary/search/search_box/cubit/cubit.dart';
// import 'package:culturalspacelibrary/search/search_box/cubit/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class SearchBox extends StatelessWidget {
//   const SearchBox({Key? key, this.accordingToCat = false}) : super(key: key);
//   final bool accordingToCat;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SearchAAACubit(),
//       child: BlocConsumer<SearchAAACubit, SearchAAAStates>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             var search = SearchAAACubit.get(context);
//             bool isLoading() {
//               return state is SearchLoadingState;
//             }
//
//             bool searchSuccess() {
//               return state is SearchSuccessState;
//             }
//
//             bool noResultsFound() {
//               return accordingToCat
//                   ? search.searchCategoryModel!.success == 0
//                   : search.searchModel!.success == 0;
//             }
//
//             return Column(
//               children: [
//                 ValidatedTextField(
//                     hasNextText: false,
//                     controller: search.searchController,
//                     icon: Icons.search,
//                     validator: search.searchValidator,
//                     errorText: 'You cannot search about empty text',
//                     hintText: 'Search',
//                     onChanged: (text) {
//                       accordingToCat
//                           ? search.searchByCategory(
//                               title: search.searchController.text)
//                           : search.search(
//                               token: CashHelper.getUserToken()!,
//                               searchText: search.searchController.text,
//                               searchType: 'name');
//                     }),
//                 if (!accordingToCat)
//                   Container(
//                       child: (() {
//                     if (isLoading()) {
//                       return const Column(children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Center(child: CircularProgressIndicator())
//                       ]);
//                     } else if (searchSuccess()) {
//                       if (noResultsFound()) {
//                         return Container(
//                             width: 300,
//                             height: 50,
//                             color: Colors.grey,
//                             child: const Center(
//                               child: Text(
//                                 'no results found',
//                                 //style: TextStyle(fontSize: 12.0),
//                               ),
//                             ));
//                       }
//                       return SingleChildScrollView(
//                         physics: const BouncingScrollPhysics(),
//                         child: Container(
//                           width: 300,
//                           height: 100,
//                           color: Colors.greenAccent,
//                           child: ListView.separated(
//                               //shrinkWrap: true,
//                               itemBuilder: (context, index) => Container(),
//                               // SearchModelViewer(
//                               // model: search.medicineModels[index],
//                               // medicineName: search.medicineModels[index].name,
//                               // medicineCategory:
//                               //     search.medicineModels[index].category,
//                               // imageLink: 'images/medicine.png'),
//                               separatorBuilder: (context, index) =>
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                               itemCount: search.medicineModels.length),
//                         ),
//                       );
//                     } else {
//                       return null;
//                     }
//                   }())),
//                 if (accordingToCat)
//                   Container(
//                       child: (() {
//                     if (isLoading()) {
//                       return const Column(children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Center(child: CircularProgressIndicator())
//                       ]);
//                     } else if (searchSuccess()) {
//                       if (noResultsFound()) {
//                         return Container(
//                             width: 300,
//                             height: 50,
//                             color: Colors.grey,
//                             child: const Center(
//                               child: Text(
//                                 'no results found',
//                                 //style: TextStyle(fontSize: 12.0),
//                               ),
//                             ));
//                       }
//                       return SingleChildScrollView(
//                         physics: const BouncingScrollPhysics(),
//                         child: Container(
//                           width: 300,
//                           height: 100,
//                           color: Colors.greenAccent,
//                           child: ListView.separated(
//                               //shrinkWrap: true,
//                               itemBuilder: (context, index) =>
//                                   SearchCategoryFound(
//                                       category:
//                                           search.categoryModels[index].title),
//                               separatorBuilder: (context, index) =>
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                               itemCount: search.categoryModels.length),
//                         ),
//                       );
//                     } else {
//                       return null;
//                     }
//                   }())),
//               ],
//             );
//           }),
//     );
//   }
// }
//
// // class SearchModelViewer extends StatelessWidget {
// //   final String medicineName;
// //   final String medicineCategory;
// //   final String imageLink;
// //   final MedicineModel model;
// //
// //   const SearchModelViewer(
// //       {Key? key,
// //       required this.model,
// //       required this.medicineName,
// //       required this.medicineCategory,
// //       required this.imageLink})
// //       : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     double imageSize = 30;
// //     return Container(
// //       color: Colors.grey,
// //       width: 300,
// //       height: 65,
// //       child: Padding(
// //         padding: const EdgeInsets.all(10.0),
// //         child: InkWell(
// //           onTap: () {
// //             navigateTo(context, MedicinePreviewScreen(medicineModel: model));
// //           },
// //           child: Row(
// //             //mainAxisAlignment: MainAxisAlignment.end,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Image.asset(
// //                 'images/medicine.png',
// //                 width: imageSize,
// //                 height: imageSize,
// //               ),
// //               const SizedBox(
// //                 height: 10,
// //               ),
// //               Column(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 children: [
// //                   Text(
// //                     medicineName,
// //                     style: const TextStyle(fontSize: 15.0),
// //                   ),
// //                   // Text(
// //                   //   medicineCategory,
// //                   //   style: const TextStyle(fontSize: 15.0),
// //                   // ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class SearchCategoryFound extends StatelessWidget {
//   const SearchCategoryFound({Key? key, required this.category})
//       : super(key: key);
//   final String category;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey,
//       width: 300,
//       height: 65,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: InkWell(
//           onTap: () {
//             //navigateTo(context, MedicinePreviewScreen(medicineModel: model));
//           },
//           child: Row(
//             //mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     category,
//                     style: const TextStyle(fontSize: 15.0),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ValidatedTextField extends StatelessWidget {
//   final GlobalKey<FormState> validator;
//   final String errorText;
//   final String hintText;
//   final bool hasNextText;
//   final Function(String)? onChanged;
//   final Function(String)? onFieldSubmitted;
//   final TextEditingController controller;
//   final bool enable;
//   final IconData? icon;
//   final Widget? suffixIcon;
//   final bool obscureText;
//   final double fontSize;
//   final double radius;
//
//   const ValidatedTextField(
//       {Key? key,
//       required this.controller,
//       required this.validator,
//       required this.errorText,
//       required this.hintText,
//       required this.onChanged,
//       this.onFieldSubmitted,
//       this.hasNextText = true,
//       this.enable = true,
//       this.icon,
//       this.suffixIcon,
//       this.obscureText = false,
//       this.fontSize = 20.0,
//       this.radius = 15.0})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     TextInputType? textInputType;
//     if (hintText == 'email') {
//       textInputType = TextInputType.emailAddress;
//     } else if (hintText == 'phone number') {
//       textInputType = TextInputType.phone;
//     }
//     return Form(
//       key: validator,
//       child: TextFormField(
//         onFieldSubmitted: onFieldSubmitted,
//         controller: controller,
//         enabled: enable,
//         textInputAction:
//             hasNextText ? TextInputAction.next : TextInputAction.done,
//         keyboardType: textInputType,
//         obscureText: obscureText,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return errorText;
//           }
//           return null;
//         },
//         onChanged: onChanged,
//         style: TextStyle(fontSize: fontSize),
//         decoration: InputDecoration(
//           suffixIcon: suffixIcon,
//           hintText: hintText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius),
//           ),
//           prefixIcon: Icon(icon),
//         ),
//       ),
//     );
//   }
// }
