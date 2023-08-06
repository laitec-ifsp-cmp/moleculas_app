import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localization/localization.dart';
import 'package:moleculas_ar/shared/theme/app_theme.dart';
import 'package:moleculas_ar/shared/widgets/no_format_link/no_format_link_widget.dart';
import 'package:moleculas_ar/shared/widgets/shared_widgets.dart';

import 'widgets/dev_info/dev_info_widget.dart';
import 'widgets/dev_topic/dev_topic_widget.dart';
import 'widgets/info_topic/info_topic_widget.dart';
import 'widgets/institutes_topic/logos_topic_widget.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: BodyGradientMarginWidget(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoTopicWidget(
                  title: "about_project".i18n(),
                  description: "about_project_description".i18n(),
                ),
                SizedBox(height: 30.h),
                const DevTopicWidget(devInfoList: devInfoList),
                SizedBox(height: 30.h),
                LogosTopicWidget(
                  title: Text("institutions".i18n()).title,
                  logoList: [
                    Image.asset(
                      "assets/images/about_us/laitec.png",
                      height: 80.h,
                    ),
                    NoFormatLinkWidget(
                      url: "https://portal.cmp.ifsp.edu.br/",
                      child: Image.asset(
                        "assets/images/about_us/ifsp.png",
                        height: 80.h,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30.h),
                LogosTopicWidget(
                  title: Text("credits".i18n()).titleSmall,
                  logoList: [
                    NoFormatLinkWidget(
                      url: "https://www.flaticon.com/",
                      child: Image.asset(
                        "assets/images/about_us/flaticon.png",
                        height: 20.h,
                        width: 102.56.w,
                      ),
                    ),
                    NoFormatLinkWidget(
                      url: "https://storyset.com/",
                      child: Image.asset(
                        "assets/images/about_us/storyset.png",
                        height: 20.h,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/images/about_us/freepik.svg",
                      height: 20.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const List<Widget> devInfoList = [
    DevInfoWidget(
      imagePath: "assets/images/about_us/profile_leticia.jfif",
      name: "Letícia M. R. Trevisan",
      description: "IFSP - Campus Campinas\nUnicamp",
      lattes: "http://lattes.cnpq.br/2662486933723854",
      linkedIn: "https://www.linkedin.com/in/trevisanleticia",
    ),
    DevInfoWidget(
      imagePath: "assets/images/about_us/profile_luiz.jfif",
      name: "Luiz H. F. de Jesus",
      description: "IFSP - Campus Campinas\nUnicamp",
      lattes: "http://lattes.cnpq.br/1440266122800640",
      linkedIn: "https://www.linkedin.com/in/luizhfjesus",
    ),
    DevInfoWidget(
      imagePath: "assets/images/about_us/profile_beatriz.jfif",
      name: "Beatriz L. de Oliveira",
      description: "IFSP - Campus Campinas",
      lattes: "http://lattes.cnpq.br/6428104716236648",
    ),
    DevInfoWidget(
      imagePath: "assets/images/about_us/profile_toshio.jfif",
      name: "Alex T. Kakizaki",
      lattes: "http://lattes.cnpq.br/5020690770878351",
    ),
    DevInfoWidget(
      imagePath: "assets/images/about_us/profile_marcio.jfif",
      name: "Márcio A. Miranda",
      description: "IFSP - Campus Campinas",
      lattes: "http://lattes.cnpq.br/3466690059671752",
      linkedIn:
          "https://www.linkedin.com/in/m%C3%A1rcio-andr%C3%A9-miranda-25896633/",
    ),
  ];
}
