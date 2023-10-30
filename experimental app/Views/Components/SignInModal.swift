//
//  SignIn.swift
//  experimental app
//
//  Created by Sebastian Schmeil on 30/10/2023.
//

import SwiftUI
import RiveRuntime

struct SignInModal: View {
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @Binding var showModal: Bool
    
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    
    func logIn(){
        isLoading = true
        if email == "" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                check.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                isLoading = false
            }
        }
        else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                check.triggerInput("Check")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                isLoading = false
                confetti.triggerInput("Trigger explosion")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                withAnimation{
                    showModal = false
                }
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 20){
            Text("Sign In")
                .font(.system(size: 40, weight: .bold))
            
            VStack{
                Text("Email")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("", text: $email)
                    .customTextField(imageName: "Icon Email")
            }
            VStack{
                Text("Password")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("", text: $password)
                    .customTextField(imageName: "Icon Password")
            }
            
            Button{
                logIn()
            } label: {
                Label("Sign In", systemImage: "arrow.right")
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(.pink)
                    .foregroundColor(.white)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 5,
                            bottomLeadingRadius: 20,
                            bottomTrailingRadius: 20,
                            topTrailingRadius: 20
                        )
                )
            }
            
            Divider()
            
            Text("Sign up with Email, Apple or Google")
                .foregroundColor(.secondary)
            HStack(spacing: 50){
                Image("Logo Email")
                Image("Logo Apple")
                Image("Logo Google")
            }
        }
        .padding(30)
        .background(.regularMaterial)
        .mask(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding()
        .overlay(
            ZStack{
                if isLoading{
                    check.view()
                        .frame(width: 100, height: 100)
                        .allowsHitTesting(false)
                }
                confetti.view()
                    .scaleEffect(3)
                    .allowsHitTesting(false)
            }
        )
    }
}

#Preview {
    SignInModal(showModal: .constant(true))
}
