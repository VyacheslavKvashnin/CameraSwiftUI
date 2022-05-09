//
//  ContentView.swift
//  CameraSwiftUI
//
//  Created by Вячеслав Квашнин on 19.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var image: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Button(action: {
                        showSheet = true
                    }, label: {
                        Image(uiImage: image ?? UIImage(named: "pic")!)
                            .resizable()
                            .frame(width: 300, height: 300)
                            .clipShape(Circle())
                    })
                }
                .padding()
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Посмотреть фото или выбрать новое"), buttons: [
                        .default(Text("Выбрать из библиотеки")) {
                            showImagePicker = true
                            sourceType = .photoLibrary
                        }, .default(Text("Сделать снимок")) {
                            
                            showImagePicker = true
                            sourceType = .camera
                        }, .cancel(Text("Отменить"))])
                }
            }
            .navigationBarTitle("Камера")
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $image, isShown: $showImagePicker, sourceType: sourceType)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
