//
//  ContentView.swift
//  Pricing-component-with-toogle-master
//
//  Created by Marcos Fabian Chong Megchun on 27/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var isMonthly: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Our pricing")
                    .font(.custom("Montserrat-Bold", size: 35))
                    .foregroundColor(Color("Grayish-blue"))
                HStack {
                    Text("Anually")
                    Toggle("", isOn: $isMonthly)
                        .toggleStyle(SwitchToggleStyle(tint: Color("Gradient02")))
                        .frame(maxWidth: 70, alignment: .leading)
                    Text("Monthly")
                }
                .foregroundColor(Color("Grayish-blue"))
                .font(.custom("Montserrat-Bold", size: 15))
                .padding(.top, 10)
                .padding(.bottom, 30)
               
                ForEach(data, id: \.id) { modal in
                    if(modal.btnWithGradient) {
                        WhiteModal(isMonthly: $isMonthly, modal: modal)
                    } else {
                        GradientModal(isMonthly: $isMonthly, modal: modal)
                    }
                   
                }
            
                
                
            }
            .padding(.top, 20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            ZStack {
                Color("Very-light-grayish-blue")
                Image("bg-top")
                    .resizable()
                    .frame(maxWidth: 300, maxHeight: 600)
                    .offset(x: 200, y: -130)
            }
            .ignoresSafeArea()
        }
    }
    
}

struct ModalData {
    let id = UUID()
    var plan: String
    var price: String
    var storage: String
    var usersCapacity: String
    var dataCapacity: String
    var colorModal: String
    var gradient01: String
    var gradient02: String
    var btnWithGradient: Bool
    var priceMonthly: String
}

var data: [ModalData] = [
    ModalData(plan: "Basic", price: "199.99", storage: "500 GB Storage", usersCapacity: "2 Users Allowed", dataCapacity: "Send up to 3 GB", colorModal: "Very-light-grayish-blue", gradient01: "Gradient01", gradient02: "Gradient02", btnWithGradient: true, priceMonthly: "19.99"),
    ModalData(plan: "Professional", price: "249.99", storage: "1 TB Storage", usersCapacity: "5 Users Allowed", dataCapacity: "Send up to 10 GB", colorModal: "Very-light-grayish-blue", gradient01: "Gradient01", gradient02: "Gradient02", btnWithGradient: false, priceMonthly: "24.99"),
    ModalData(plan: "Master", price: "399.99", storage: "2 TB Storage", usersCapacity: "10 Users Allowed", dataCapacity: "Send up to 20 GB", colorModal: "Very-light-grayish-blue", gradient01: "Gradient01", gradient02: "Gradient02", btnWithGradient: true, priceMonthly: "39.99"),
]

struct ModalPrice: View {
    var color: String
    var price: String
    
    var body: some View {
        Text("modal 1")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WhiteModal: View {
    @Binding var isMonthly: Bool
    var modal: ModalData
    var body: some View {
        VStack(spacing: 20) {
            Text(modal.plan)
                .foregroundColor(Color("Grayish-blue"))
            Text("$")
                .font(.custom("Montserrat-Bold", size: 30))
            + Text(isMonthly ? modal.priceMonthly : modal.price)
                .font(.custom("Montserrat-Bold", size: 53))
            Divider()
            Text(modal.storage)
            Divider()
            Text(modal.usersCapacity)
            Divider()
            Text(modal.dataCapacity)
            Divider()
            Button("LEARN MORE", action: {})
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color(modal.gradient01), Color(modal.gradient02)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
                .foregroundColor(Color(.white))
                .font(.custom("Montserrat-Bold", size: 17))
            
        }
        .frame(maxWidth: 340)
        .padding(20)
        .background(Color("Light-grayish-blue"))
        .cornerRadius(10)
        .padding(15)
        .font(.custom("Montserrat-Bold", size: 15))
    }
}

struct GradientModal: View {
    @Binding var isMonthly: Bool
    var modal: ModalData
    var body: some View {
        VStack(spacing: 20) {
            Text(modal.plan)
            Text("$")
                .font(.custom("Montserrat-Bold", size: 30))
            + Text(isMonthly ? modal.priceMonthly : modal.price)
                .font(.custom("Montserrat-Bold", size: 53))
            Divider()
                .background(Color("Light-grayish-blue"))
            Text(modal.storage)
            Divider()
                .background(Color("Light-grayish-blue"))
            Text(modal.usersCapacity)
            Divider()
                .background(Color("Light-grayish-blue"))
            Text(modal.dataCapacity)
            Divider()
                .background(Color("Light-grayish-blue"))
            Button("LEARN MORE", action: {})
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color("Light-grayish-blue"))
                .cornerRadius(10)
                .foregroundColor(Color("Gradient02"))
                .font(.custom("Montserrat-Bold", size: 17))
            
        }
        .foregroundColor(Color("Light-grayish-blue"))
        .frame(maxWidth: 340)
        .padding(20)
        .background(LinearGradient(gradient: Gradient(colors: [Color(modal.gradient01), Color(modal.gradient02)]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
        .padding(15)
        .font(.custom("Montserrat-Bold", size: 15))
    }
}
