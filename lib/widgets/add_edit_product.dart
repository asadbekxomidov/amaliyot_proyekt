import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/products_controller.dart';
import '../models/product.dart';

class EditProductScreen extends StatefulWidget {
  final String? productId;

  EditProductScreen({this.productId});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _id;
  late String _categoryId;
  late String _type;
  late String _name;
  late double _price;
  late Color _color;
  late double _rating;
  late int _reviewsCount;
  late String _descriptionTitle;
  late String _descriptionContent;
  late String _imageLink;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.productId != null) {
      final product = Provider.of<ProductsController>(context, listen: false)
          .list
          .firstWhere((prod) => prod.id == widget.productId);
      _id = product.id;
      _categoryId = product.categoryId;
      _type = product.type;
      _name = product.name;
      _price = product.price;
      _color = product.color;
      _rating = product.rating;
      _reviewsCount = product.reviewsCount;
      _descriptionTitle = product.descriptionTitle;
      _descriptionContent = product.descriptionContent;
      _imageLink = product.imageLink;
    } else {
      _id = UniqueKey().toString();
      _categoryId = '';
      _type = '';
      _name = '';
      _price = 0.0;
      _color = Colors.white;
      _rating = 0.0;
      _reviewsCount = 0;
      _descriptionTitle = '';
      _descriptionContent = '';
      _imageLink = '';
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newProduct = Product(
        id: _id,
        categoryId: _categoryId,
        type: _type,
        name: _name,
        price: _price,
        color: _color,
        rating: _rating,
        reviewsCount: _reviewsCount,
        descriptionTitle: _descriptionTitle,
        descriptionContent: _descriptionContent,
        imageLink: _imageLink,
      );
      if (widget.productId != null) {
        Provider.of<ProductsController>(context, listen: false)
            .updateProduct(_id, newProduct);
      } else {
        Provider.of<ProductsController>(context, listen: false)
            .addProduct(newProduct);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productId != null ? 'Edit Product' : 'Add Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a name.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              // Add other form fields for categoryId, type, price, etc.
              // Similar to the above TextFormField
            ],
          ),
        ),
      ),
    );
  }
}
