import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazyydoctor/model/specialist.dart';
import 'package:eazyydoctor/model/doctors.dart';
import 'package:eazyydoctor/notifier/specialist_notifier.dart';
import 'package:eazyydoctor/notifier/doctors_notifier.dart';

getSpecialist(SpecialistNotifier specialistNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('specialist').get();

  List<Specialist> _specialistList = [];

  snapshot.docs.forEach((document) {
    Specialist specialist =
        Specialist.fromMap(document.data() as Map<String, dynamic>);
    _specialistList.add(specialist);
  });

  specialistNotifier.specialistList = _specialistList;
}

getDoctors(DoctorsNotifier doctorsNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('doctors').get();

  List<Doctors> _doctorsList = [];

  snapshot.docs.forEach((document) {
    Doctors doctors = Doctors.fromMap(document.data() as Map<String, dynamic>);
    _doctorsList.add(doctors);
  });

  doctorsNotifier.doctorsList = _doctorsList;
}
