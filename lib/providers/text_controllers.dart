import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final urlCtrProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final locationCtrProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final gameAccessCodeProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
