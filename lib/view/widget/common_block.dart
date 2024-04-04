import 'package:flutter/material.dart';
import 'package:projeto_open/view/widget/common_titlelogo.dart';

class CBlock extends StatelessWidget {
  final String? title;
  final Widget content;
  final Function? function;
  final bool checkIcon;
  final double? size;

  const CBlock(
      {super.key,
      this.title,
      required this.content,
      this.function,
      this.checkIcon = false,
      this.size = 24});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (title != null)
                  ? (function != null)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (checkIcon)
                                ? Row(
                                    children: [
                                      Flexible(
                                        child: Wrap(children: [
                                          Text(
                                            title!,
                                          ),
                                        ]),
                                      ),
                                    ],
                                  )
                                : Expanded(
                                    child: CTitle(
                                      title!,
                                    ),
                                  ),
                            IconButton(
                              onPressed: () {
                                function!();
                              },
                              icon: const Icon(Icons.navigate_next),
                            )
                          ],
                        )
                      : (checkIcon)
                          ? Row(
                              children: [
                                Flexible(
                                  child: Wrap(children: [
                                    CTitle(
                                      title!,
                                    ),
                                  ]),
                                ),
                              ],
                            )
                          : CTitle(title!)
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: content,
              )
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
