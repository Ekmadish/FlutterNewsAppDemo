import 'package:NewsApp/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1

  categoryModel.categoryName = 'Bussines';
  categoryModel.imageUrl =
      'https://www.extensisgroup.com/getmedia/043c2549-29d3-49a7-b4af-b93fb7e3682e/How-PEO-Helps-Brokers?width=450&height=324';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://1yfd8w35xqq41q3ou63czp8h-wpengine.netdna-ssl.com/wp-content/uploads/2018/10/350x215-FEAT-in-post-Entertainment.jpg";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://www.legalandgeneralgroup.com/media/17941/gettyimages-1205638055.jpg?anchor=center&mode=crop&width=1600&height=1200&rnd=132427631660000000";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl = "http://www.ehealing.us/HealthNews.jpg";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "https://scontent.fala1-1.fna.fbcdn.net/v/t1.0-9/224868_10150949543001870_1784623197_n.jpg?_nc_cat=100&_nc_sid=7aed08&_nc_ohc=bIudgFi1GF0AX9DbyZC&_nc_ht=scontent.fala1-1.fna&oh=5761e95fbdeb3f029837295f72e5023a&oe=5F733659";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      "https://crosspointacademy.org/wp-content/uploads/2017/05/sports-news.jpg";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR9q3NywADTzZBFpMiTvo5qCZehzrsDIw7tGg&usqp=CAU";
  category.add(categoryModel);

  return category;
}
