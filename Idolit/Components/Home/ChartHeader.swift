//
//  ChartHeader.swift
//  Idolit
//
//  Created by Mohamed Osman on 10.09.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI
import URLImage
import AVKit

struct ChartHeader: View {
    @State var playerMuted = false
    var post: Post
    @State var url: URL?
    
    var body: some View {
        
        let playerModel = PlayerViewModel(url: url ?? URL(string:post.mediaUrl)!)
        
        VStack (alignment: .center){
            
            if post.videodUrl?.hasPrefix("LOL") == true{
                PlayerView(viewModel: playerModel)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55, alignment: .center)
                                        .clipShape(RoundedRectangle(cornerRadius: 5,
                                    style: .continuous))
                                        .shadow(color: .red, radius: 6)

                    .onTapGesture {
                        self.playerMuted.toggle()
                        if self.playerMuted {
                            playerModel.player?.isMuted = false
                        }
                        else {
                            playerModel.player?.isMuted = true

                    }

                }

            }else if post.videodUrl?.hasPrefix("LMAO") == true{
          
                URLImage(URL(string: post.mediaUrl)!,

                                       content: {
                                          $0.image

                                              .resizable()
                                              .aspectRatio(contentMode: .fill)

                                        
                   }).frame(width: 55, height: 55, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 5,
                style: .continuous))
                    .shadow(color: .red, radius: 6)
            }else{
                Text("To Be Deleted")
                    .frame(width: 55, height: 55, alignment: .center)
                                        .clipShape(RoundedRectangle(cornerRadius: 5,
                                    style: .continuous))
                                        .shadow(color: .red, radius: 6)

                  
            }
            
            
        }.onAppear {
            playerModel.player?.isMuted = true
            playerModel.player?.play()
        }.onDisappear {
            playerModel.player?.pause()
        }

    }
}

class PlayerViewModel: ObservableObject {
    @Published var player: AVPlayer? // can be changable depending on modified URL, etc.
    init(url: URL) {
        self.player = AVPlayer(url: url)
    }
}


struct PlayerView: UIViewRepresentable { // just thing wrapper, as intended
    var viewModel: PlayerViewModel

    func makeUIView(context: Context) -> PlayerUIView {
        PlayerUIView(frame: .zero , player: viewModel.player) // if needed viewModel can be passed completely
    }

    func updateUIView(_ v: PlayerUIView, context: UIViewRepresentableContext<PlayerView>) {
    }
}


class PlayerUIView: UIView {
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
        playerLayer.frame.size = CGSize(width:55, height: 55)
        //playerLayer.frame = bounds
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        player?.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self,
                                                      selector: #selector(playerItemDidReachEnd(notification:)),
                                                      name: .AVPlayerItemDidPlayToEndTime,
                                                      object: player?.currentItem)
        player?.play()
    }
    @objc func playerItemDidReachEnd(notification: Notification) {
            playerLayer.player?.seek(to: CMTime.zero)
        }

    required init?(coder: NSCoder) { fatalError("not implemented") }
}
