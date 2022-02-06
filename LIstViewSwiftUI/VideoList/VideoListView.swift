//
//  VideoListView.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 05/02/22.
//

import SwiftUI


struct VideoListView:View {
    
    var videoslist = VideoList.topTen
    
    var body: some View {
        NavigationView {
            List(videoslist, id:\.id) { video in
                NavigationLink(destination: VideoDetailsView(video: video), label: {
                    VideoCell(video: video)
                })
            }
            .navigationTitle("Top 10 videos")
        }
    }
}


struct VideoCell:View {
    var video:Video
    
    var body: some View {
        HStack {
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height:70)
                .cornerRadius(5)
                .padding(.vertical, 4)
            VStack(alignment: .leading, spacing: 5){
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}



struct VideoContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
