import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/product.dart';

class ProductServices{
  Future createPoduct(ProductModel productModel) async {
    return await FirebaseFirestore.instance
        .collection("productCollection")
        .add(productModel.toJson());
  }
  Stream<List<ProductModel>> fetchProducts() {
    return FirebaseFirestore.instance
        .collection("productCollection")
        .snapshots()
        .map((productList) =>
        productList.docs.map((e) => ProductModel.fromJson(e.data())).toList());
  }
  Future updateProduct(String ProductID, String ProductTitle,String ProductDescription) async{
    return await FirebaseFirestore.instance
        .collection("productCollection")
        .doc(ProductID)
        .update({
      "productTitle":ProductTitle,
      "productDescription":ProductDescription,
    });
  }
  Future deleteProduct (String ProductID) async {
    return await FirebaseFirestore.instance
        .collection("taskCollection")
        .doc(ProductID)
        .delete();
  }
  Stream<List<ProductModel>> fetchSoldProducts() {
    return FirebaseFirestore.instance
        .collection('productCollection')
        .where('isSold', isEqualTo: true)
        .snapshots()
        .map((productList) =>
        productList.docs.map((e) => ProductModel.fromJson(e.data())).toList());
  }
  Stream<List<ProductModel>> fetchUnSoldProducts() {
    return FirebaseFirestore.instance
        .collection('productCollection')
        .where('isSold', isEqualTo: false)
        .snapshots()
        .map((productList) =>
        productList.docs.map((e) => ProductModel.fromJson(e.data())).toList());
  }

}