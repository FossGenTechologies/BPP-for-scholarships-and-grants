////////////////////////////////////////////////////////////
/// Company Name - Fossgen Technologies Pvt Ltd
/// Contact Us - https://fossgentechnologies.com/contact-us/
/// Support - support@fossgentechnologies.com
//////////////////////////////////////////////////////////

import 'package:dsep_bpp/provides/ApiServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../utils/colors_widget.dart';
import '../widgets/custom_loader.dart';
import '../widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AppliedScreenDetails extends StatefulWidget {
  final json;
  final additionalDetails;
  final String appId;
  final String applicationStatus;
  const AppliedScreenDetails(
      {Key? key,
      this.json,
      this.applicationStatus = '',
      required this.appId,
      this.additionalDetails})
      : super(key: key);

  @override
  State<AppliedScreenDetails> createState() => _AppliedScreenDetailsState();
}

class _AppliedScreenDetailsState extends State<AppliedScreenDetails> {
  var json;
  bool isLoading = false;

  bool isFamMemWrkng = false;
  var additionalDetail;

  @override
  void initState() {
    super.initState();
    // entire data is obtanied here to show prefilled within the boxes
    json = widget.json;

    additionalDetail = widget.additionalDetails;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    Widget _title(String value) {
      return Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Text(
              value,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: value == "Additional Details" ? 24 : 16),
            ),
          ],
        ),
      );
    }

    Future<void> _launchUrl(Uri uri) async {
      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }
    }

    String branchName(String txt) {
      switch (txt) {
        case 'mum':
          return 'Mumbai';
        case 'pne':
          return 'Pune';
        case 'bng':
          return 'Pune';
        case 'del':
          return 'Delhi';
        default:
          return '';
      }
    }

    String releationshipName(String txt) {
      switch (txt) {
        case 'M':
          return 'Mother';
        case 'F':
          return 'Father';

        default:
          return '';
      }
    }

    Widget _body(double h, double w) {
      return Container(
        margin: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: 'Application Details',
                size: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    json['person']["id"] == null
                        ? Container(
                            height: 0,
                          )
                        : _title('Candidate Id'),
                    json['person']["id"] == null
                        ? Container(
                            height: 0,
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                    json['person']["id"] == null
                        ? Container(
                            height: 0,
                          )
                        : Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 1, color: Colors.black)),
                            child: TextWidget(
                              text: json['person']["id"].toString(),
                            ),
                          ),
                    json['person']['name'] == null
                        ? Container(
                            height: 0,
                          )
                        : const SizedBox(
                            height: 20,
                          ),
                    json['person']['name'] == null
                        ? Container(
                            height: 0,
                          )
                        : _title('Name'),
                    json['person']['name'] == null
                        ? Container(
                            height: 0,
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                    json['person']['name'] == null
                        ? Container(
                            height: 0,
                          )
                        : Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 1, color: Colors.black)),
                            child: TextWidget(
                              text: json['person']['name'].toString(),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    _title('Gender'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: TextWidget(
                        text: json['person']["gender"].toString(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _title('Additional Details'),
                    const SizedBox(
                      height: 10,
                    ),
                    additionalDetail['name'] == null ||
                            additionalDetail['name'] == ''
                        ? Container()
                        : Column(children: [
                            _title('Name'),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: TextWidget(
                                text: additionalDetail['name'],
                              ),
                            ),
                          ]),
                    additionalDetail['phone'] == null ||
                            additionalDetail['phone'] == ''
                        ? Container()
                        : Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            _title('Phone No'),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: TextWidget(
                                text: additionalDetail['phone'],
                              ),
                            ),
                          ]),
                    additionalDetail['address'] == null ||
                            additionalDetail['address'] == ''
                        ? Container()
                        : Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            _title('Address'),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: TextWidget(
                                text: additionalDetail['address'],
                              ),
                            ),
                          ]),
                    additionalDetail['needOfScholarship'] == null ||
                            additionalDetail['needOfScholarship'] == ''
                        ? Container()
                        : Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              _title('Tell us why you need scholarship'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: TextWidget(
                                  text: additionalDetail['needOfScholarship'],
                                ),
                              ),
                            ],
                          ),
                    additionalDetail['docUrl'] == null ||
                            additionalDetail['docUrl'] == ''
                        ? Container()
                        : Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              _title('Documents URL'),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () => _launchUrl(
                                    Uri.parse(additionalDetail['docUrl'])),
                                child: AbsorbPointer(
                                  child: Container(
                                    height: 50,
                                    padding: const EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1, color: Colors.black)),
                                    child: TextWidget(
                                      text: additionalDetail['docUrl'],
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    !isFamMemWrkng
                        ? Container()
                        : Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              _title('Additional Info'),
                              const SizedBox(
                                height: 10,
                              ),
                              _title(
                                  'Is your parents working with the organization'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: TextWidget(
                                  text: additionalDetail['isFamMemWrkng'] == 'Y'
                                      ? 'Yes'
                                      : '',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              _title('Name of Parent'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: TextWidget(
                                  text: additionalDetail['pname'],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              _title('Department Name'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: TextWidget(
                                  text: additionalDetail['pdept'],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              _title('Branch'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: TextWidget(
                                  text: additionalDetail['pbranch'],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              _title('Branch'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: TextWidget(
                                  text: branchName(additionalDetail['pbranch']),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              _title('Relationship with person'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: TextWidget(
                                  text: releationshipName(
                                      additionalDetail['prel']),
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    widget.applicationStatus == '2' ||
                            widget.applicationStatus == '5'
                        ? Container()
                        : isLoading
                            ? SizedBox(height: 50, child: Loader())
                            : Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (() {
                                        var data = {
                                          "remarks": "Application is rejected."
                                        };
                                        isLoading = true;
                                        ApiServices()
                                            .rejectApplication(
                                                data, widget.appId)
                                            .then((value) {
                                          if (value['status'] == true) {
                                            isLoading = false;
                                            Navigator.pop(context, true);
                                          } else {
                                            isLoading = false;
                                          }
                                        });
                                        setState(() {});
                                      }),
                                      child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: const TextWidget(
                                          text: 'Reject',
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (() {
                                        var data = {
                                          "remarks": "Application is awarded."
                                        };
                                        isLoading = true;
                                        ApiServices()
                                            .awardApplication(
                                                data, widget.appId)
                                            .then((value) {
                                          if (value['status'] == true) {
                                            isLoading = false;
                                            Navigator.pop(context, true);
                                          } else {
                                            isLoading = false;
                                          }
                                        });
                                        setState(() {});
                                      }),
                                      child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: const TextWidget(
                                          text: 'Award',
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      );
    }

    return PlatformScaffold(
        appBar: PlatformAppBar(
          leading: PlatformIconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context, {'details': null}),
          ),
          cupertino: (_, __) => CupertinoNavigationBarData(
            // If this is enabled and set to true then the IconButton above will complain of no parent Material widget
            noMaterialParent: true,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Application Details',
              style: TextStyle(color: Colors.white)),
        ),
        body: _body(screenHeight, screenWidth));
  }
}
