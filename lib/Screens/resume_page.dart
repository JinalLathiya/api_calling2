import 'dart:async';

import 'package:flutter/material.dart';

import '../helpers/helperclass.dart';
import '../model/details_model_class.dart';

class Infopage extends StatefulWidget {
  const Infopage({Key? key}) : super(key: key);

  @override
  State<Infopage> createState() => _InfopageState();
}

class _InfopageState extends State<Infopage> {
  late Future<Details?> fecthedData;
  TextStyle myTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  @override
  initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
    fecthedData = APIHelper.apiHelper.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Information',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: fecthedData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            Details data = snapshot.data as Details;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Spacer(),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(data.img),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${data.FName} ${data.LName}",
                      style: myTextStyle,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      data.gender,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Icon(
                          Icons.account_circle_sharp,
                          color: Colors.blueAccent,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Age : ${data.age}",
                          style: myTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.green,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          data.Pnumber,
                          style: myTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          data.dob.split("T")[0],
                          style: myTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          data.City,
                          style: myTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Icon(
                          Icons.email_rounded,
                          color: Colors.blueGrey,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          data.email,
                          style: myTextStyle,
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );
          } else {
            return Center(
                child: Stack(
              alignment: Alignment.center,
              children: const [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                ),
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ],
            ));
          }
        },
      ),
    );
  }
}
