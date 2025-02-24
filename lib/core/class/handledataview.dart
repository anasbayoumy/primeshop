import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:primeshop/core/class/statusrequest.dart';
import 'package:primeshop/core/constants/imageasset.dart';

class Handledataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handledataview(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(imageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(imageAsset.nowifi, width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(imageAsset.error, width: 250, height: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(imageAsset.nodata,
                            width: 250, height: 250, fit: BoxFit.contain))
                    : widget;
  }
}

class HandledataviewRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandledataviewRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(imageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(imageAsset.nowifi, width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(imageAsset.error, width: 250, height: 250))
                : widget;
  }
}
