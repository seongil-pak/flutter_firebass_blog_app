import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
// 제목, 작성자, 내용

  TextEditingController writeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    writeController.dispose();
    titleController.dispose();
    contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () {
                  final result = formKey.currentState?.validate() ?? false;
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    '완료',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                TextFormField(
                  controller: writeController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(hintText: '작성자'),
                  validator: (value) {
                    // trim : 문자열 앞 뒤로 공백 제거
                    if (value?.trim().isEmpty ?? true) {
                      return '작성자를 입력해 주세요';
                    }
                    // 유효성 검사 성공
                    return null;
                  },
                ),
                TextFormField(
                  controller: titleController,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(hintText: '제목'),
                  validator: (value) {
                    // trim : 문자열 앞 뒤로 공백 제거
                    if (value?.trim().isEmpty ?? true) {
                      return '제목을 입력해 주세요';
                    }
                    // 유효성 검사 성공
                    return null;
                  },
                ),
                SizedBox(
                  height: 200,
                  child: TextFormField(
                    controller: contentController,
                    maxLines: null, // 반드시 null로 할당 (개행할 때)
                    expands: true, // 박스 크기를 늘릴려면 필수로 설정 해줘야 함
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(hintText: '내용'),
                    validator: (value) {
                      // trim : 문자열 앞 뒤로 공백 제거
                      if (value?.trim().isEmpty ?? true) {
                        return '내용을 입력해 주세요';
                      }
                      // 유효성 검사 성공
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                    child: Icon(Icons.image),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
