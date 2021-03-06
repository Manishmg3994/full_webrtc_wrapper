import 'package:flutter/material.dart';

import 'package:full_webrtc_wrapper/sdk/connection.dart';
import 'package:full_webrtc_wrapper/views/remote_connection.dart';


class RemoteVideoPageView extends StatefulWidget {
  final List<Connection> connections;

  const RemoteVideoPageView({Key? key, required this.connections})
      : super(key: key);

  @override
  State createState() => _RemoteVideoPageViewState();
}

class _RemoteVideoPageViewState extends State<RemoteVideoPageView> {
  Widget _buildRemoteViewPage(int start) {
    var widgets = <Widget>[];
    var end = start + 2;
    var length = widget.connections.length;
    widget.connections
        .sublist(start, end <= length ? end : length)
        .forEach((connection) {
      widgets.add(RemoteConnection(
        renderer: connection.renderer!,
        connection: connection,
      ));
    });

    return Container(
      child: Center(
        child: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widgets,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widgets,
                );
        }),
      ),
    );
  }

  List<Widget> _buildRemoteViewPages() {
    var widgets = <Widget>[];
    for (int start = 0; start < widget.connections.length; start = start + 2) {
      widgets.add(_buildRemoteViewPage(start));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: _buildRemoteViewPages(),
    );
  }
}

