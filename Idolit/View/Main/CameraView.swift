//
//  CameraView.swift
//  Idolit
//
//  Created by Mohamed Osman on 07.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI
import ProgressHUD

struct CameraView: View {
    @State var expand = false
    @State var removed = false
    @ObservedObject var cameraViewModel = CameraViewModel()
    
    func sharePost() {
        // cameraViewModel.uploadpost
        //ProgressHUD.show("", interaction: false)
       
        cameraViewModel.sharePost(completed: {
            print("done")
            self.clean()
          }) { (errorMessage) in
            print("Error: \(errorMessage)")
            self.cameraViewModel.showAlert = true
            self.cameraViewModel.errorString = errorMessage
            self.clean()
            
            // calling the function to clean up the fields
            
            
        }
    }

    func clean() {
        self.cameraViewModel.caption = ""
        self.cameraViewModel.image = Image(systemName: IMAGE_PHOTO)
        self.cameraViewModel.imageData = Data()
    }
    
    var body: some View {
        NavigationView {
        VStack(){
            
            // Image placeholder
            cameraViewModel.image2.resizable().frame(width: 400,height: 400, alignment: .center).clipped()
                
                .shadow(color: .red, radius: 2)
            
            HStack(spacing:30){
                
                VStack(){
                    
                    // Setting the image and the text on the horizontal dropmenu
                    
                    if  cameraViewModel.imageData.isEmpty == true && cameraViewModel.videoDataUrl == nil{
                        Text("Add")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    
                    }else if cameraViewModel.imageData.isEmpty == false{
                    
                        Image(systemName: removed ? "checkmark.circle.fill": "arrow.right")
                        .resizable()
                            .frame(width: 20, height: 20).onTapGesture {
                                print("Well done Mo")
                            }
                        .foregroundColor(.white)
                       
                    }else if cameraViewModel.videoDataUrl != nil{
                        Image(systemName: removed ? "checkmark.circle.fill": "arrow.right")
                        .resizable()
                        .frame(width: 20, height: 20).onTapGesture {
                            print("Well done Mo")
                        }
                        .foregroundColor(.white)
                    }
                
                }.frame(width: 40, height: 40, alignment: .center).onTapGesture {
                    if  cameraViewModel.imageData.isEmpty == true && cameraViewModel.videoDataUrl == nil{
                        
                                        self.expand.toggle()
                                       
                                       }
                }
                if expand {
                    // Picking a video
                    Button(action: {
                        print("2")
                        self.cameraViewModel.showvideoPicker = true
                        self.expand.toggle()
                        self.removed.toggle()
                        
                    }) {
                        Text("video")
                            .padding()
                    }.foregroundColor(.white)
                    // Picking a photo
                    Button(action: {
                        print("1")
                        self.cameraViewModel.showImagePicker = true
                        self.expand.toggle()
                        self.removed.toggle()
                    }) {
                        Text("photo")
                            .padding()
                    }.foregroundColor(.white)
                    
                }
            }
            
            .padding()
            
            .background(LinearGradient(gradient: .init(colors: [.blue, .purple]) , startPoint: .top, endPoint: .bottom))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5)
            .animation(.spring())
            .frame(width: 290,height: 80, alignment: .center).padding()
            
            // Remove tool
            if  cameraViewModel.imageData.isEmpty == false {
                
                Text("Replace").onTapGesture {
                    self.removed.toggle()
                    self.expand.toggle()
                }
                               
            }else if   cameraViewModel.videoDataUrl != nil{
                Text("Not the right one?").onTapGesture {
                    self.removed.toggle()
                    self.expand.toggle()
                  
                }
            }
            
            // Title
            TextField("Write a title...", text: $cameraViewModel.caption).padding().border(Color.purple).cornerRadius(4).padding()
            
        }.navigationBarTitle(Text("Camera"), displayMode: .inline).navigationBarItems(trailing: Button(action: sharePost) {
            
            Image(systemName: "arrow.turn.up.right").imageScale(Image.Scale.large)
        }.alert(isPresented: $cameraViewModel.showAlert) {
            Alert(title: Text("Error"), message: Text(self.cameraViewModel.errorString), dismissButton: .default(Text("OK")))
        })
        .sheet(isPresented: $cameraViewModel.showvideoPicker) {
                ImagePicker(showvideoPicker: $cameraViewModel.showvideoPicker, videoDataUrl: $cameraViewModel.videoDataUrl)
            }
        }
        .sheet(isPresented: $cameraViewModel.showImagePicker) {
            
            Photopicker(showImagePicker: self.$cameraViewModel.showImagePicker, pickedImage: self.$cameraViewModel.image, imageData: self.$cameraViewModel.imageData)
        }
        
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
