import 'package:flutter/material.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'package:full_webrtc_wrapper/sdk/connection.dart';

class RemoteConnection extends StatefulWidget {
//  final RTCVideoRenderer renderer = new RTCVideoRenderer();
  final RTCVideoRenderer renderer;
  final Connection connection;

//  final MediaStream stream;

//  RemoteConnection({@required this.stream});
  const RemoteConnection(
      {Key? key, required this.renderer, required this.connection})
      : super(key: key);

  @override
  _RemoteConnectionState createState() => _RemoteConnectionState();
}

class _RemoteConnectionState extends State<RemoteConnection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          RTCVideoView(widget.renderer),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Container(
              padding: const EdgeInsets.all(5),
              color: const Color.fromRGBO(0, 0, 0, 0.7),
              child: Text(
                widget.connection.name!,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            color: widget.connection.videoEnabled!
                ? Colors.transparent
                : Colors.black,
            child: Center(
                child: Text(
              widget.connection.videoEnabled! ? '' : widget.connection.name!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            )),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              padding: const EdgeInsets.all(5),
              color: const Color.fromRGBO(0, 0, 0, 0.7),
              child: Row(
                children: <Widget>[
                  Icon(
                    widget.connection.videoEnabled!
                        ? Icons.videocam
                        : Icons.videocam_off,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Icon(
                    widget.connection.audioEnabled! ? Icons.mic : Icons.mic_off,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
