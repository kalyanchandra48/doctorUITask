import 'package:doctor_app/colors.dart';
import 'package:doctor_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Specialist {
  final String name;
  final String image;

  Specialist({required this.name, required this.image});
}

class HoemPage extends StatelessWidget {
  HoemPage({super.key});

  final List<String> _list = [
    'Enter Name',
    'Choose Date & Time',
    'Choose Problem',
    'Choose Test',
    'Choose Consultation',
  ];
  final List<Specialist> specialists = [
    Specialist(name: 'Dr. Tracy Austin', image: 'assets/doctor1.png'),
    Specialist(name: 'Dr. Tracy Austin', image: 'assets/doctor2.png'),
    Specialist(name: 'Dr. Tracy Austin', image: 'assets/doctor3.png'),
    Specialist(name: 'Dr. Tracy Austin', image: 'assets/doctor4.png'),
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: size.height * 0.1),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                ClipPath(
                  clipper: CircleClipper(),
                  child: Container(
                    width: double.infinity, // Adjust as needed
                    height: size.height * 0.47, // Adjust as needed
                    color: clipathCircleColor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.2),
                  height: size.height * 0.56,
                  width: double.infinity, // Adjust as needed
                  decoration: BoxDecoration(
                    color: const Color(0xff5AE0AE),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.150,
                      left: size.width * 0.07,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Problems',
                          style: boldSixteen.copyWith(color: blackColor),
                        ),
                        GridView.count(
                          padding: EdgeInsets.only(top: size.height * 0.020),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.5,
                          children: const [
                            DentalOption(
                              imageName: 'assets/dental.svg',
                              label: 'Dental Braces',
                            ),
                            DentalOption(
                              imageName: 'assets/teeth.svg',
                              label: 'Dental Crown',
                            ),
                            DentalOption(
                              imageName: 'assets/legs.svg',
                              label: 'Dental Filling',
                            ),
                            DentalOption(
                              imageName: 'assets/medicine.svg',
                              label: 'Anesthesia',
                            ),
                          ],
                        ),

                        // Add the following code
                        Center(
                          child: Container(
                            height: size.height * 0.01,
                            width: size.width * 0.13,
                            padding: const EdgeInsets.all(2),
                            margin: EdgeInsets.only(top: size.height * 0.025),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: size.width * 0.07,
                                decoration: BoxDecoration(
                                  color: chipsConatinerColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.08,
                    vertical: size.height * 0.03,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: size.width * 0.04,
                    mainAxisSpacing: size.height * 0.045,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: specialists.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        SpecialistCard(specialist: specialists[index]),
                        Positioned(
                          bottom: -size.height * 0.015,
                          left: size.width * 0.12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xff6B5AE0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text('Book', style: boldSixteen),
                          ),
                        )
                      ],
                    );
                  },
                ),
                Stack(
                  children: [
                    SvgPicture.asset('assets/address.svg'),
                    Positioned(
                      top: size.height * 0.095,
                      left: size.width * 0.05,
                      child: Container(
                        width: size.width * 0.5,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.height * 0.016,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff4C3045),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dental Clinic',
                              style: boldSixteen.copyWith(color: Colors.white),
                            ),
                            const Text(
                              '#34 Harsh heights, 18th Cross Sitanagar Delhi - 110007',
                              style: regulartwelve,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              top: size.height * 0.080,
              left: size.width * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/doctor.png'),
                      ),
                      const SizedBox(width: 16), // Adjust as needed
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: regulartwelve,
                          ),
                          Text(
                            'Misty Simon',
                            style: boldSixteen,
                          ),
                        ],
                      ),
                      SizedBox(width: size.width * 0.43), // Adjust as needed
                      SvgPicture.asset('assets/setting.svg',
                          width: 30, height: 30)
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: size.height * 0.035),
                      height: size.height * 0.050, // Adjust as needed
                      width: size.width * 0.9, // Adjust as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: <Widget>[
                          const SizedBox(width: 16), // Adjust as needed
                          const Text(
                            'Search doctor',
                            style: semiBlackBold,
                          ),
                          SizedBox(
                              width: size.width * 0.55), // Adjust as needed

                          SvgPicture.asset('assets/search-normal.svg',
                              width: 23, height: 23)
                        ],
                      )),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                      ),
                      child: Text(
                        'Appointment Booking',
                        style: boldSixteen,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.020),
                    height: size.height * 0.48,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F7FE),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 29),
                            itemCount: 5,
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 20);
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(left: 16, right: 16),
                                height: size.height * 0.05,
                                padding: const EdgeInsets.only(
                                  left: 16,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _list[index],
                                    style: semiBlackBold,
                                  ),
                                ),
                              );
                            }),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, top: 24),
                          height: size.height * 0.05,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff6B5AE0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'Book Appointment',
                              style: boldSixteen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialistCard extends StatelessWidget {
  final Specialist specialist;

  const SpecialistCard({super.key, required this.specialist});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: doctorBoardColor,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(
                specialist.image,
                height: 136,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            specialist.name,
            style: boldSixteen.copyWith(color: blackColor),
          ),
          Text('Dental Specialist',
              style: regulartwelve.copyWith(color: blackColor)),
        ],
      ),
    );

    // Add the following code
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    double radius = 1.009 * width; // 91% of the width
    double centerX = 0.30 * width; // 18% of the width
    double centerY = 0.015 * height; // 6% of the height

    return Path()
      ..addOval(Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: radius,
      ));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class DentalOption extends StatelessWidget {
  final String imageName;
  final String label;

  const DentalOption({super.key, required this.imageName, required this.label});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.18,
      width: size.width * 0.45,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: chipsConatinerColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: size.height * 0.05,
                  width: size.width * 0.20,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                  decoration: BoxDecoration(
                    color: chipsCircleColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SvgPicture.asset(
                    imageName,
                  )),
              CircleAvatar(
                radius: 15,
                backgroundColor: chipBlackColor,
                child: CircleAvatar(
                  radius: 7.5,
                  backgroundColor: label == 'Dental Braces'
                      ? chippurpleColor
                      : chipGreyColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
