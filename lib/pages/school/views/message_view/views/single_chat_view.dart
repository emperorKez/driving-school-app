import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class InstSingleChatView extends StatefulWidget {
  const InstSingleChatView({super.key});

  @override
  State<InstSingleChatView> createState() => _InstSingleChatViewState();
}

class _InstSingleChatViewState extends State<InstSingleChatView> {
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Mikael Anders',
          style: TextStyle(
            fontFamily: 'Lato',
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: _renderMobileBody(s),
    );
  }

  ListView _renderMobileBody(Size s) {
    return ListView(
      children: [
        SizedBox(
          width: s.width,
          height: s.height * 0.8,
          child: const _ChatView(),
        ),
        _InputField(s: s),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    super.key,
    required this.s,
  });

  final Size s;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: s.width,
      height: s.height * 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(-1, -1),
            color: AppColors.grey1,
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppColors.grey1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppColors.green,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppColors.red,
                  ),
                ),
                contentPadding: const EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 5,
                  bottom: 5,
                ),
                hintText: 'Type you message here',
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey1,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25),
            child: Image.asset(
              'assets/imgs/ins/school/send.png',
              width: 26,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ListView(
        shrinkWrap: true,
        children: const [
          _RecievedMsgCard(),
          _MyMsgCard(),
          _RecievedMsgCard(),
          _RecievedMsgCard(),
          _MyMsgCard(),
          _RecievedMsgCard(),
          _MyMsgCard(),
        ],
      ),
    );
  }
}

class _MyMsgCard extends StatelessWidget {
  const _MyMsgCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.green,
                    ),
                    child: const Text(
                      'Hello, yes I am well. What is your question about the assignment?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 3,
                      top: 7,
                    ),
                    child: Text(
                      '3.50 Pm, 12/11/2022',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.grey1,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RecievedMsgCard extends StatelessWidget {
  const _RecievedMsgCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _UserImg(img: 'assets/imgs/ins/lessons/avatar1.png'),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(1, 1),
                          color: AppColors.grey2,
                        )
                      ]),
                  child: const Text(
                    'Hi Professor Smith, I hope this email finds you well. I had a question about the assignment that was due last week',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    '3.50 Pm, 12/11/2022',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.grey1,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _UserImg extends StatelessWidget {
  const _UserImg({
    required this.img,
    super.key,
  });
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
