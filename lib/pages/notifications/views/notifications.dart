import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstNotificationsView extends StatefulWidget {
  const InstNotificationsView({super.key});

  @override
  State<InstNotificationsView> createState() => _InstNotificationsViewState();
}

class _InstNotificationsViewState extends State<InstNotificationsView> {
  final List<NotificationDetails> _nots = [
    NotificationDetails(
      icon: 'assets/imgs/ins/notifications/notification_type2.png',
      hasAction: true,
      title: 'Mikael Anders',
      subTitle: 'Booked',
      desc: 'Eget sed sed scelerisque ',
      detail: '10 Hours Packege',
    ),
    NotificationDetails(
        icon: 'assets/imgs/ins/notifications/notification_type2.png',
        hasAction: false,
        title: 'Completed',
        subTitle: '',
        desc: 'Isaiah Richardson Completed 90 Min Traffic Light Drive',),
    NotificationDetails(
        icon: 'assets/imgs/ins/notifications/notification_type2.png',
        hasAction: false,
        title: 'Completed',
        subTitle: '',
        desc: 'Glenn Musa Completed Safety Courses on Road',),
    NotificationDetails(
        icon: 'assets/imgs/ins/notifications/notification_type1.png',
        hasAction: false,
        title: 'Richardson Massage',
        subTitle: '',
        desc: 'Lorem ipsum dolor sit amet, con...',),
    NotificationDetails(
        icon: 'assets/imgs/ins/notifications/notification_type1.png',
        hasAction: false,
        title: 'Bella Yasmin Massage',
        subTitle: '',
        desc: 'Lorem ipsum dolor sit amet, con...',),
    NotificationDetails(
        icon: 'assets/imgs/ins/notifications/notification_type2.png',
        hasAction: false,
        title: 'Tyler Sienna Massage',
        subTitle: '',
        desc: 'Lorem ipsum dolor sit amet, con...',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Notification',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: _buildMobileBody(),
    );
  }

  ListView _buildMobileBody() {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _nots.length,
            itemBuilder: (cxt, index) {
              final not = _nots[index];
              return NotificationCard(not: not);
            },
          ),
        ),
      ],
    );
  }
}

class NotificationDetails {
  NotificationDetails({
    // required this.type,
    required this.icon,
    required this.hasAction,
    required this.title,
    required this.subTitle,
    required this.desc,
    this.detail = '',
  });

  // final String type;
  final String icon;
  final bool hasAction;
  final String title;
  final String subTitle;
  final String desc;
  final String detail;
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.not,
    super.key,
  });

  final NotificationDetails not;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: KorbilTheme.of(context).alternate2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 15),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: KorbilTheme.of(context).primaryColor,
            ),
            child: Center(
              child: Image.asset(
                not.icon,
                width: 20,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: RichText(
                          text: TextSpan(
                            text: not.title,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: KorbilTheme.of(context).secondaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: ' ${not.subTitle}',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: KorbilTheme.of(context).secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/imgs/ins/notifications/not_sub2.png',
                        width: 12,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: not.hasAction
                            ? MediaQuery.of(context).size.width * 0.4
                            : MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          not.desc,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    not.detail,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (not.hasAction)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: KorbilTheme.of(context).primaryColor,
              ),
              child: Center(
                child: Text(
                  'Approval',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: KorbilTheme.of(context).white,
                  ),
                ),
              ),
            )
          else
            Container(),
        ],
      ),
    );
  }
}
