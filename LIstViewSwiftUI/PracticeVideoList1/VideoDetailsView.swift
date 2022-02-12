//
//  VideoDetailsView.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 06/02/22.
//

import SwiftUI

struct VideoDetailsView: View {
    
    var video:Video
    
    var body: some View {
        VStack (spacing:25){
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(12)
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 140) {
                Label("\(video.viewCount)", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(video.uploadDate)
                
            }
            Text(video.description)
                .font(.body)
                .padding()
            Spacer()
            Link(destination: video.url, label: {
                Text("Watch now")
                    .bold()
                    .font(.title2)
                    .frame(width: 290, height: 50, alignment: .center)
                    .background(Color(.systemRed))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            })
            
        }
    }
}

struct VideoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailsView(video:VideoList.topTen.first!)
    }
}
