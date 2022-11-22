//
//  CameraGuidanceView.swift
//  Pestless
//
//  Created by Local Administrator on 20/11/22.
//

import SwiftUI

struct CameraGuidanceView: View {
    @Binding var isShow: Bool
    var body: some View {
        ZStack{
            Color.black.opacity(1)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Please take a focus photo of the pest")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.pestTitleGreen)
                    .padding(.bottom, 50)
                    .padding(.top, 50)
                Image("noGuidance2")
                    .resizable()
                    .frame(width: 192, height: 192)
                Image(systemName: "arrow.down")
                    .resizable()
                    .foregroundColor(.pestGreen)
                    .frame(width: 30, height: 70)
                Image("yesGuidance")
                    .resizable()
                    .frame(width: 192, height: 192)
                Spacer()
            }
        }
        .onTapGesture {
            isShow = false
        }
    }
}
struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct CameraGuidanceView_Previews: PreviewProvider {
    static var previews: some View {
        CameraGuidanceView(isShow: .constant(false))
    }
}
