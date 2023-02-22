// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Helper/App_notifier.dart';

class WebViewForm extends StatefulWidget {
  @override
  _WebViewFormState createState() => _WebViewFormState();
}

class _WebViewFormState extends State<WebViewForm> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return Scaffold(
          appBar:
          AppBar(
            backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
            // surfaceTintColor: Colors.white,
            actions: [


              // FlutterSwitch(
              //   width: 45.0,
              //   height: 25.0,
              //   toggleSize: 20.0,
              //   value: Provider.of<AppStateNotifier>(context).isDarkMode,
              //   borderRadius: 45.0,
              //   padding: 1.0,
              //   activeToggleColor: Color(0xFF6E40C9),
              //   inactiveToggleColor: Color(0xFF2F363D),
              //   activeSwitchBorder: Border.all(
              //     color: Colors.black38,
              //     width: 1.0,
              //   ),
              //   inactiveSwitchBorder: Border.all(
              //     color: Color(0xFFD1D5DA),
              //     width: 1.0,
              //   ),
              //   activeColor: Colors.white24,
              //   inactiveColor: Colors.white,
              //   activeIcon: Icon(
              //     Icons.nightlight_round,
              //     color: Color(0xFFF8E3A1),
              //   ),
              //   inactiveIcon: Icon(
              //     Icons.wb_sunny,
              //     color: Color(0xFFFFDF5D),
              //   ),
              //   onToggle: (val) {
              //     Provider.of<AppStateNotifier>(context, listen: false)
              //         .updateTheme(val);
              //   },
              // ),
              NavigationControls(_controller.future),

              const SizedBox(
                width: 7,
              ),
            ],
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(CupertinoIcons.back)),

            title: Text(
              'K.B.M Ziyarat Package',
              style: const TextStyle(fontSize: 16),
            ),



          ),

          // We're using a Builder here so we have a context that is below the Scaffold
          // to allow calling Scaffold.of(context) so we can show a snackbar.
          body: Container()
        );
      }
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: Text(
              "Loading ...\nPlease ensure that Internet is tuned on.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Please check your internet connection or restart the app.",
            ),
          );
        }
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;

        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                if (await controller!.canGoBack()) {
                  await controller?.goBack();
                } else {
                  // ignore: deprecated_member_use
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("No back history item")),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                if (await controller!.canGoForward()) {
                  await controller?.goForward();
                } else {
                  // ignore: deprecated_member_use
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("No forward history item")),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                controller?.reload();
              },
            ),
          ],
        );
      },
    );
  }
}
