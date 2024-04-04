import 'package:flutter/material.dart';

import 'package:projeto_open/controller/open_controller.dart';
import 'package:projeto_open/model/post_model.dart';

class ChallengeItemWidget extends StatefulWidget {
  final int index;
  final OpenController controller;
  final PostModel postModel;
  const ChallengeItemWidget({
    Key? key,
    required this.index,
    required this.controller,
    required this.postModel,
  }) : super(key: key);

  @override
  State<ChallengeItemWidget> createState() => _ChallengeItemWidgetState();
}

class _ChallengeItemWidgetState extends State<ChallengeItemWidget> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
                height: 230.00,
                width: 182.00,
                child: Stack(alignment: Alignment.topCenter, children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          24.00,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 2.00,
                            blurRadius: 2.00,
                            offset: Offset(
                              0,
                              2,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 151.00,
                            margin: const EdgeInsets.only(
                              left: 16,
                              top: 22,
                              right: 14,
                            ),
                            child: Text(
                              widget.postModel.title,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.10,
                                height: 1.43,
                              ),
                            ),
                          ),
                          Container(
                            width: 138.00,
                            margin: const EdgeInsets.only(
                              left: 16,
                              top: 8,
                              right: 16,
                            ),
                            child: Text(
                              widget.postModel.body,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.40,
                                  height: 1.33,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}
