import 'package:flutter/material.dart';
import 'package:flutter_firebass_blog_app/ui/detail/detail_page.dart';
import 'package:flutter_firebass_blog_app/ui/write/write_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return WritePage();
              }),
            );
          },
          child: Icon(Icons.edit),
        ),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('BLOG'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '최근 글',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      return item();
                    }),
              )
            ],
          ),
        ));
  }

  Widget item() {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailPage();
              },
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 120,
          child: Stack(
            children: [
              Positioned(
                  right: 0,
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://picsum.photos/200/300',
                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(right: 100),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today I Learned',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Spacer(),
                    Text(
                      'Flutter 그리드 뷰를 배워 봄 Flutter 그리드 뷰를 배워 봄 Flutter 그리드 뷰를 배워 봄',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '2024.12.03 16:15',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
