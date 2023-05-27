import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum LOADINGINDICATORTYPE {
  defaultType,
  spinkitTpe,
}

class LoadingIndicator extends StatelessWidget {
  final LOADINGINDICATORTYPE loadingindicatortype;
  const LoadingIndicator({
    super.key,
    this.loadingindicatortype = LOADINGINDICATORTYPE.spinkitTpe,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: 30,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: index.isEven
                ? Theme.of(context).primaryColor
                : Theme.of(context).highlightColor,
          ),
        );
      },
    );
  }
}
