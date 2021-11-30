//
//  HeaderCell.swift
//  Idolit
//
//  Created by Mohamed Osman on 05.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI
import URLImage
import AVKit


struct HeaderCell: View {
    @State var playerPaused = false
    var post: Post
    @State var url: URL?
    
    var body: some View {
        
        let playerModel1 = PlayerViewModel1(url: url ?? URL(string:post.mediaUrl)!)
        
        VStack (alignment: .center){
            Image(systemName: "trash.circle").onTapGesture {
                
            }
            Spacer()
            if post.videodUrl?.hasPrefix("LOL") == true{
                PlayerView1(viewModel: playerModel1)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.size.width, height: 550, alignment:.center).clipShape(RoundedRectangle(cornerRadius:45,
                         style: .continuous)).shadow(color:.purple, radius: 6)

                    .onTapGesture {
                        self.playerPaused.toggle()
                        if self.playerPaused {
                            playerModel1.player?.pause()
                        }
                        else {
                            playerModel1.player?.play()

                    }

                }

            }else if post.videodUrl?.hasPrefix("LMAO") == true{
          
                URLImage(URL(string: post.mediaUrl)!,

                                       content: {
                                          $0.image

                                              .resizable()
                                              .aspectRatio(contentMode: .fill)

                                        
                   }).frame(width: UIScreen.main.bounds.size.width, height: 550, alignment: .center).clipShape(RoundedRectangle(cornerRadius:45,
                   style: .continuous)).shadow(color: .purple, radius: 6)
            }
            else{
                Text("To Be Deleted")
                    .frame(width: UIScreen.main.bounds.size.width, height: 550, alignment:.center).clipShape(RoundedRectangle(cornerRadius:45,
                         style: .continuous)).shadow(color:.purple, radius: 6)

                    .onTapGesture {
                        self.playerPaused.toggle()
                        if self.playerPaused {
                            playerModel1.player?.pause()
                        }
                        else {
                            playerModel1.player?.play()

                    }

                }
            }
            
            
        }//.onAppear {
//            playerModel1.player?.play()
//        }
            .onDisappear {
            playerModel1.player?.pause()
        }

    }
}

class PlayerViewModel1: ObservableObject {
    @Published var player: AVPlayer? // can be changable depending on modified URL, etc.
    init(url: URL) {
        self.player = AVPlayer(url: url)
    }
}


struct PlayerView1: UIViewRepresentable { // just thing wrapper, as intended
    var viewModel: PlayerViewModel1

    func makeUIView(context: Context) -> PlayerUIView1 {
        PlayerUIView1(frame: .zero , player: viewModel.player) // if needed viewModel can be passed completely
    }

    func updateUIView(_ v: PlayerUIView1, context: UIViewRepresentableContext<PlayerView1>) {
    }
}


class PlayerUIView1: UIView {
    private let playerLayer = AVPlayerLayer()
    var player: AVPlayer?

    init(frame: CGRect, player: AVPlayer?) { // player is a model so inject it here
        super.init(frame: frame)

        self.player = player
        self.playerLayer.player = player
        self.layer.addSublayer(playerLayer)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //playerLayer.frame.size = CGSize(width:463, height: 550)
        playerLayer.frame = bounds
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        player?.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(self,
                                                      selector: #selector(playerItemDidReachEnd(notification:)),
                                                      name: .AVPlayerItemDidPlayToEndTime,
                                                      object: player?.currentItem)
        player?.pause()
    }
    @objc func playerItemDidReachEnd(notification: Notification) {
            playerLayer.player?.seek(to: CMTime.zero)
        }

    required init?(coder: NSCoder) { fatalError("not implemented") }
}




/*
        VStack (alignment: .center){
            
                
             URLImage(URL(string: post.mediaUrl)!,
                                    
                                    content: {
                                       $0.image
                                    
                                           .resizable()
                                           .aspectRatio(contentMode: .fill)
                                           
                                          
                                       
                                       
                }).frame(width: UIScreen.main.bounds.size.width, height: 550, alignment: .center).clipShape(RoundedRectangle(cornerRadius:45,
                style: .continuous)).shadow(color: .purple, radius: 6)
 
        }
    */
//struct PlayerView: UIViewRepresentable {
//    let player: AVPlayer
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
//        (uiView as? PlayerUIView)?.updatePlayer(player: player)
//    }
//
//    func makeUIView(context: Context) -> UIView {
//        return PlayerUIView(player: player)
//    }
//}
//
//class PlayerUIView: UIView {
//    private let playerLayer = AVPlayerLayer()
//    init(player: AVPlayer) {
//        super.init(frame: .zero)
//
//        playerLayer.player = player
//        layer.addSublayer(playerLayer)
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented loooooooooooooooooooooool")
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        playerLayer.frame = bounds
//    }
//
//    func updatePlayer(player: AVPlayer) {
//        self.playerLayer.player = player
//    }
//}

/*
PlayerView(viewModel: playerModel)
    .aspectRatio(contentMode: .fill)
    .frame(width: UIScreen.main.bounds.size.width, height: 550, alignment:.center).clipShape(RoundedRectangle(cornerRadius:45,
         style: .continuous)).shadow(color:.purple, radius: 6)

    .onTapGesture {
        self.playerPaused.toggle()
        if self.playerPaused {
            playerModel.player?.pause()
        }
        else {
            playerModel.player?.play()

    }

}
*/
