//
//  ContentView.swift
//  Pestless
//
//  Created by Local Administrator on 20/10/22.
//

import SwiftUI
import CoreData

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @State var selectedIndex = 0
    @State var image: Data?
    @State var selectedImage: Data?
    @State var isCamera: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                HomeView()
                            }
                        }
                        Spacer()
                    }
                case 1:
                    NavigationView {
                        PestMainView()
                    }
                case 2:
                    NavigationView {
//                        CustomCameraView()
                    }
                case 3:
                    NavigationView {
                        VStack {
                            Text("fourth screen")
                        }
                        .navigationTitle("Bioesticides")
                    }
                case 4:
                    NavigationView {
                        VStack {
                            Text("fifth screen")
                        }
                        .navigationTitle("Tips")
                    }
                default:
                    NavigationView {
                        VStack {
                            Text("first screen")
                        }
                        .navigationTitle("Home")
                    }
                }
            }
            
            //MARK: TABBAR
            
            Divider()
            HStack {
                Button(action: {
                    self.selectedIndex = 0
                }, label: {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.accentColor)
                })
                Spacer()
                
                Button(action: {
                    self.selectedIndex = 1
                }, label: {
                    Image(systemName: "ant.fill")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.accentColor)
                })
                Spacer()
                
                Button(action: {
                    self.selectedIndex = 2
                    self.isCamera = true
                }, label: {
                    Image(systemName: "camera.fill")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.orange)
                        .clipShape(Circle())
                    
                })
                Spacer()
                
                Button(action: {
                    self.selectedIndex = 3
                }, label: {
                    Image(systemName: "leaf.fill")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.accentColor)
                })
                Spacer()
                
                Button(action: {
                    self.selectedIndex = 4
                }, label: {
                    Image(systemName: "shield.fill")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.accentColor)
                })
                
                
                
                //                ForEach(0..<3, id: \.self) { number in
                //                    Spacer()
                //                    Button(action: {
                //
                //                    }, label: {
                //                        Text("house")
                //                        Image(systemName: "house")
                //                            .font(.system(size: 25, weight: .regular, design: .default))
                //                            .foregroundColor(.black)
                //                    })
                //                    Spacer()
                //                }
                //                .padding()
            }
            .padding(.leading)
            .padding(.trailing)
        }
        .fullScreenCover(isPresented: $isCamera) {
            CustomCameraView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
//tes rizky
