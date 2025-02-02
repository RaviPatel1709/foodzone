// import 'package:flutter/material.dart';
// import 'package:upi_india/upi_india.dart';
//
// class UPIPaymentScreen extends StatefulWidget {
//   final String amount;
//
//   UPIPaymentScreen({required this.amount});
//
//   @override
//   _UPIPaymentScreenState createState() => _UPIPaymentScreenState();
// }
//
// class _UPIPaymentScreenState extends State<UPIPaymentScreen> {
//   UpiIndia _upiIndia = UpiIndia();
//   List<UpiApp>? apps;  // List to store available UPI apps
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUpiApps();
//   }
//
//   // Fetch available UPI apps using the method available in the package
//   _fetchUpiApps() async {
//     try {
//       apps = await _upiIndia.getAllUpiApps(mandatoryTransactionId: false);
//       setState(() {});
//     } catch (e) {
//       print("Error fetching UPI apps: $e");
//       setState(() {
//         apps = [];
//       });
//     }
//   }
//
//   // Initiate UPI Payment
//   Future<void> initiateUPIPayment(UpiApp selectedApp, BuildContext context) async {
//     try {
//       // Remove non-numeric characters (e.g., ₹ symbol)
//       String amountWithoutSymbol = widget.amount.replaceAll(RegExp(r'[^0-9.]'), '');
//
//       // Parse the cleaned string to double
//       double amount = double.parse(amountWithoutSymbol);
//
//       // Check if the amount exceeds the bank's UPI limit (Assuming limit is ₹50,000)
//       if (amount > 50000) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Amount exceeds the UPI transaction limit. Please reduce the amount."))
//         );
//         return;  // Exit the function early to prevent payment initiation
//       }
//
//       // Start the transaction using the selected app
//       print("Initiating payment via ${selectedApp.name}");
//       UpiResponse response = await _upiIndia.startTransaction(
//         app: selectedApp,  // Selected UPI app
//         receiverUpiId: 'rutanmandaviya14-1@okhdfcbank',  // Replace with actual merchant's UPI ID
//         receiverName: 'Rutan Mandaviya',  // Replace with actual merchant's name
//         transactionRefId: 'txn${DateTime.now().millisecondsSinceEpoch}',
//         transactionNote: 'Payment for product',
//         amount: amount,
//       );
//
//       // Handle payment response
//       switch (response.status) {
//         case UpiPaymentStatus.SUCCESS:
//           print("Payment Success");
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Successful!")));
//           break;
//         case UpiPaymentStatus.FAILURE:
//           print("Payment Failure");
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Failed!")));
//           break;
//         case UpiPaymentStatus.SUBMITTED:
//           print("Payment Submitted");
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Submitted!")));
//           break;
//         default:
//           print("Unknown Payment Status");
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Unknown Payment Status")));
//       }
//     } catch (e) {
//       print("Error during payment: $e");
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
//     }
//   }
//
//   // Display UPI apps
//   Widget displayUpiApps() {
//     if (apps == null) {
//       return Center(child: CircularProgressIndicator());
//     } else if (apps!.isEmpty) {
//       return Center(child: Text("No UPI apps found."));
//     } else {
//       return ListView.builder(
//         itemCount: apps!.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Image.memory(apps![index].icon, width: 40, height: 40),
//             title: Text(apps![index].name),
//             onTap: () {
//               initiateUPIPayment(apps![index], context);
//             },
//           );
//         },
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('UPI Payment'),
//         backgroundColor: Colors.green,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Text(
//               'Total Amount: ${widget.amount}',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(child: displayUpiApps()),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class UPIPaymentScreen extends StatefulWidget {
  final String amount;

  UPIPaymentScreen({required this.amount});

  @override
  _UPIPaymentScreenState createState() => _UPIPaymentScreenState();
}

class _UPIPaymentScreenState extends State<UPIPaymentScreen> {
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  @override
  void initState() {
    super.initState();
    _fetchUpiApps();
  }

  _fetchUpiApps() async {
    try {
      apps = await _upiIndia.getAllUpiApps(mandatoryTransactionId: false);
      setState(() {});
    } catch (e) {
      print("Error fetching UPI apps: $e");
      setState(() {
        apps = [];
      });
    }
  }

  Future<void> initiateUPIPayment(UpiApp selectedApp, BuildContext context) async {
    try {
      String amountWithoutSymbol = widget.amount.replaceAll(RegExp(r'[^0-9.]'), '');
      double amount = double.parse(amountWithoutSymbol);

      if (amount > 50000) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Amount exceeds the UPI transaction limit.")));
        return;
      }

      UpiResponse response = await _upiIndia.startTransaction(
        app: selectedApp,
        receiverUpiId: 'q459633083@ybl',
        receiverName: 'Mr KETANBHAI DAMJIBHAI PADALIYA',
        transactionRefId: 'txn${DateTime.now().millisecondsSinceEpoch}',
        transactionNote: 'Payment for product',
        amount: amount,
      );

      switch (response.status) {
        case UpiPaymentStatus.SUCCESS:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Successful!")));
          break;
        case UpiPaymentStatus.FAILURE:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Failed!")));
          break;
        case UpiPaymentStatus.SUBMITTED:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Submitted!")));
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Unknown Payment Status")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Widget displayUpiApps() {
    if (apps == null) {
      return Center(child: CircularProgressIndicator());
    } else if (apps!.isEmpty) {
      return Center(child: Text("No UPI apps found."));
    } else {
      return ListView.builder(
        itemCount: apps!.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Image.memory(apps![index].icon, width: 40, height: 40),
              title: Text(
                apps![index].name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onTap: () {
                initiateUPIPayment(apps![index], context);
              },
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI Payment'),
        backgroundColor: Colors.green,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Total Amount: ${widget.amount}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Expanded(child: displayUpiApps()),
          ],
        ),
      ),
    );
  }
}
