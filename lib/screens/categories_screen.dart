import 'package:biodict/models/biology_term.dart';
import 'package:flutter/material.dart';
import '../data/biology_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 2.5,
          ),
          itemCount: BiologyData.categories.length,
          itemBuilder: (context, index) {
            final category = BiologyData.categories[index];
            return CategoryCard(category: category);
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final BiologyCategory category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Color(0xFF3A3A3A), width: 1),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to category terms
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${category.name} selected')),
          );
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                category.icon,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  category.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}