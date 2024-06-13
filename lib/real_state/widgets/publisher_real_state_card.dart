import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/real_state/other/collections.dart';

class PublisherRealStateCard extends StatelessWidget {
  const PublisherRealStateCard(
      {super.key,
      required this.realState,
      required this.actualiser,
      required this.delete,
      required this.modify});
  final delete;
  final modify;
  final actualiser;
  final RealState realState;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: realState.status == Status.inactif? .6 : 1 ,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(9)),
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(3),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: realState.id,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 226, 226, 226),
                            borderRadius: BorderRadius.circular(6)),
                        child: realState.images.isEmpty
                            ? const Image(
                                image:
                                    AssetImage('assets/images/placeholder.png'),
                                fit: BoxFit.cover,
                              )
                            : EFadeInImage(
                                radius: 6,
                                image: CachedNetworkImageProvider(
                                    realState.images[0]),
                              ),
                      ),
                      Positioned(
                        bottom: 6,
                        left: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.circular(2)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                child: Row(children: [
                                  const Icon(Icons.photo_camera_back_outlined,
                                      size: 13, color: Colors.white),
                                  3.w,
                                  EText(
                                    realState.images.length.toString(),
                                    color: Colors.white,
                                    size: 18,
                                    weight: FontWeight.w600,
                                  )
                                ])),
                            3.h,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 6.0),
                              decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(2)),
                              child: EText(
                                  GFunctions.isToday(realState.date)
                                      ? "Aujourd'hui"
                                      : GFunctions.isYesterday(realState.date)
                                          ? 'Hier'
                                          : GFunctions.ilYa(realState.date),
                                  color: Colors.white,
                                  weight: FontWeight.w600,
                                  size: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                6.w,
                SizedBox(
                  width: Get.width - 151.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            color: realState.status == null
                                ? Colors.amber
                                : realState.status == Status.actif
                                    ? Colors.blue
                                    : realState.status == Status.refuse
                                        ? Colors.red
                                        : Colors.grey,
                            borderRadius: BorderRadius.circular(3)),
                        child: ETextRich(textSpans: [
                          ETextSpan(
                            text: realState.status == null
                                ? "Encours de verification"
                                : realState.status == Status.actif
                                    ? "Actif"
                                    : realState.status == Status.refuse
                                        ? "Refusé"
                                        : "Inactif",
                            color: Colors.white,
                            weight: FontWeight.w500,
                          )
                        ]),
                      ),
                      Row(
                        children: [
                          TitleText(
                            "${GFunctions.priceString(realState.prix.toInt().toString())} F",
                          ),
                          EText((realState.vente
                              ? ''
                              : realState.categorie == Categories.terrains
                                  ? '/ an'
                                  : '  / mois'))
                        ],
                      ),
                      EText(
                        realState.categorie,
                        weight: FontWeight.bold,
                      ),
                      6.h,
                      EText(
                          realState.description
                              .replaceAll('*', '')
                              .replaceAll('\n', ' '),
                          maxLines: 1,
                          weight: FontWeight.w500,
                          color: Colors.black),
                      6.h,
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: realState.quartier,
                              style: const TextStyle(
                                color: Colors.black,
                              )),
                          const TextSpan(text: " • "),
                          TextSpan(
                              text: realState.ville,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                          const TextSpan(text: " • "),
                          TextSpan(
                              text: realState.region,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                        ]),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                        ),
                        textScaleFactor: .7,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      6.h,
                    ],
                  ),
                )
              ],
            ),
            9.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black54,
                      ),
                      3.w,
                      EText(
                        realState.visite.toString(),
                        weight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SimpleOutlineButton(
                        height: 40,
                        radius: 3,
                        width: Get.width - 235,
                        color: GFunctions.isToday(realState.date)
                            ? Colors.grey
                            : null,
                        onTap: GFunctions.isToday(realState.date)
                            ? () {}
                            : actualiser,
                        child: EText(
                          "Actualiser",
                          color: GFunctions.isToday(realState.date)
                              ? Colors.grey
                              : Theme.of(context).primaryColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                      6.w,
                      SimpleOutlineButton(
                        radius: 3,
                        width: 50,
                        height: 40,
                        color: Color.fromARGB(255, 0, 128, 11),
                        onTap:modify == null?(){
                          Toasts.error(context, description: "Impossible de modifier l'annonce");
                        }: modify,
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                                image: AssetImage(("assets/icons/edit.png")),
                                height: 25,
                                color: Color.fromARGB(255, 0, 128, 11)),
                          ],
                        ),
                      ),
                      6.w,
                      SimpleButton(
                        radius: 3,
                        width: 50,
                        height: 40,
                        color: Colors.black,
                        onTap: delete,
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.trash,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            6.h,
          ],
        ),
      ),
    );
  }
}
