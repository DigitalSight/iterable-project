//
//  ContentView.swift
//  iterable-demo
//
//  Created by David Jarrin on 3/4/21.
//

import SwiftUI
import IterableSDK

struct ContentView: View {
    var body: some View {
        Text(IterableAPI.userId ?? "userID not set")
        Text(IterableAPI.email ?? "email not set")
        Button("Update configuration", action: {
            let dataField : [String: Any] = [
                    "isRegisteredUser": "true",
                    "firstName": "David",
                    "SA_User_Test_Key": "completed"
            ]
            IterableAPI.updateUser(dataField, mergeNestedObjects: false,
                onSuccess: { _ in
                    print("success")
                },
                onFailure: { (reason, _) in
                    print("reason \(String(describing: reason))")
                }
            )
            
        })
        .padding()
        Button("Send Event") {
            let dataField : [String: Any] = [
                "platform":"iOS",
                "isTestEvent":true,
                "url":"https://iterable.com/sa-test/David",
                "secret_code_key":"Code_123"
            ]
            IterableAPI.track(event: "mobileSATestEvent", dataFields: dataField,
                  onSuccess: { _ in
                      print("success")
                  },
                  onFailure: { (reason, _) in
                    print("reason \(String(describing: reason))")
                  }
            )
            
        }
    }
}
