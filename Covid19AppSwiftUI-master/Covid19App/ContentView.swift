//
//  ContentView.swift
//  Covid19App
//
//  Created by Ipung Dev Center on 23/08/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab : Int = 1
    var body: some View {
        GeometryReader {
            geo in
            //MARK: MAIN CONTAINER
            VStack{
                //MARK: 1 TOP LAYOUT
                TopLayout()
                    .padding(EdgeInsets.init(top: 20, leading: 0, bottom: 0, trailing: 0))
                    .frame(width: geo.size.width)
                    .background(Color(#colorLiteral(red: 0.269092679, green: 0.2473217845, blue: 0.5970885754, alpha: 1)))
                    .clipShape(RoundedCorner(radius: 30, corners: [.bottomLeft, .bottomRight]))
                
                ScrollContent()
                Spacer()
                //MARK: BOTTOM TABS
                BottomTabs(selectedTab: self.$selectedTab)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: 0 CREATE ROUNDED SHAPE
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//MARK: 1 TOP MENU
struct TopMenu: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image(systemName: "text.justifyleft")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            Button(action: {}){
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.white)
            }
        }
        .padding([.leading,.trailing],20)
        .padding(.top, 20)
    }
}

//MARK: 2 TOP TITLE
struct TopTitle: View {
    var body: some View {
        HStack{
            Text("Covid-19")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(Color.white)
            Spacer()
            
            HStack{
                HStack{
                    Image("bendera")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                    
                    Text("Indonesia")
                        .font(.headline)
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: 10, height: 8)
                        .foregroundColor(Color.secondary)
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(20)
            }.frame(height: 30)
        }
        .padding([.leading,.trailing], 30)
        .padding(.top, 30)
    }
}


//MARK: 3 CONTACT
struct Contact: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Are you feeling sick?")
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .foregroundColor(Color.white)
            Text("If tou feel sick with any of covid-19 symptoms please call or SMS us immediately for help.")
                .font(.system(size: 12, weight: .medium, design: .default))
                .foregroundColor(Color(#colorLiteral(red: 0.7209628224, green: 0.713842988, blue: 0.9002917409, alpha: 1)))
            .fixedSize(horizontal: false, vertical: true)
            
            HStack(spacing:15){
                Button(action:{}){
                    HStack{
                        Spacer()
                        Image(systemName: "phone.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                        Spacer()
                        Text("Call Now")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                }.frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.9986541867, green: 0.3014758825, blue: 0.3537710607, alpha: 1)))
                    .cornerRadius(30)
                
                Button(action:{}){
                    HStack{
                        Spacer()
                        Image(systemName: "message.fill")
                            .resizable().frame(width: 25, height: 25)
                            .foregroundColor(Color.white)
                        Spacer()
                        Text("Send SMS")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                }
                .frame(height: 55)
                .background(Color(#colorLiteral(red: 0.2983902991, green: 0.4748489261, blue: 0.9987656474, alpha: 1))).cornerRadius(30)
            }
            .padding(.top, 5)
        }
        .padding([.leading,.trailing], 30)
        .padding(.top, 40).padding(.bottom, 30)
    }
}

//MARK: 4 TOP LAYOUT
struct TopLayout: View {
    var body: some View {
        VStack{
            //MARK: TOP MENU
            TopMenu()
            //MARK: TOP TITLE DROPDOWN
            TopTitle()
            //MARK: CONTACT
            Contact()
        }
        
    }
}

//MARK: 5 PREVENTION
struct Prevention: View {
    var body: some View {
        HStack{
            Text("Prevention")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            Spacer()
        }
        .padding([.leading,.trailing], 30)
        .padding(.top, 20)
    }
}

//MARK: 6 ICON
struct ICON: View {
    var body: some View {
        HStack(spacing:20){
            VStack(alignment: .center){
                Image("family")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Avoid close contact")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            VStack(alignment: .center){
                Image("washing")
                    .resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Clean your hand often")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            VStack(alignment: .center){
                Image("masker")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Wear a facemask")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding([.leading,.trailing], 30)
        .padding(.top, 20)
    }
}

//MARK: 7 BANNER
struct Banner: View {
    var body: some View {
        GeometryReader {
            geo in
            ZStack{
                ZStack(alignment: .bottomLeading){
                    HStack{
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Do you own test!")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            Text("Follow the instructions to do your own test")
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding()
                        .frame(width: geo.size.width * 0.6, height: 120)
                    }
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.269092679, green: 0.2473217845, blue: 0.5970885754, alpha: 0.7520414573)), Color(#colorLiteral(red: 0.269092679, green: 0.2473217845, blue: 0.5970885754, alpha: 1))]), startPoint: .bottom, endPoint: .topTrailing))
                    .cornerRadius(20)
                    
                    HStack{
                        Image("doctor")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:100,height:150)
                        Spacer()
                    }
                }
                
            }
            .padding([.leading,.trailing], 30)
            .padding(.top, 20)
        }
        
    }
}

//MARK: 8 Scroll Content
struct ScrollContent: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            //MARK: PREVENTION
            VStack{
                Prevention()
                
                //MARK: ICON 3
                ICON()
                
                //MARK: BANNER
                Banner()
                Spacer()
            }.padding(EdgeInsets.init(top: 0, leading: 0, bottom: 150, trailing: 0))
        }
    }
}

//MARK: 9 BOTTOM TABS
struct BottomTabs: View {
    @Binding var selectedTab : Int
    var body: some View {
        HStack{
            Button(action: {
                self.selectedTab = 1
            }){
                Image(systemName: "house.fill")
                    .resizable().frame(width: 25, height: 25)
                    .padding([.leading,.trailing], 0)
                    .foregroundColor(self.selectedTab == 1 ? Color.white : Color.secondary)
                    .padding()
                    .background(self.selectedTab == 1 ? Color(#colorLiteral(red: 0.269092679, green: 0.2473217845, blue: 0.5970885754, alpha: 1)) : Color.white)
                    .cornerRadius(20)
            }
            Spacer()
            Button(action: {
                self.selectedTab = 2
            }){
                Image(systemName: "chart.bar")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding([.leading,.trailing], 0)
                    .foregroundColor(self.selectedTab == 2 ? Color.white : Color.secondary)
                    .padding()
                    .background(self.selectedTab == 2 ? Color(#colorLiteral(red: 0.269092679, green: 0.2473217845, blue: 0.5970885754, alpha: 1)) : Color.white)
                    .cornerRadius(20)
            }
            Spacer()
            Button(action: {
                self.selectedTab = 3
            }){
                Image(systemName: "doc.text")
                    .resizable().frame(width: 25, height: 25)
                    .padding([.leading,.trailing], 0)
                    .foregroundColor(self.selectedTab == 3 ? Color.white : Color.secondary)
                    .padding()
                    .background(self.selectedTab == 3 ? Color(#colorLiteral(red: 0.269092679, green: 0.2473217845, blue: 0.5970885754, alpha: 1)) : Color.white)
                    .cornerRadius(20)
            }
            Spacer()
            Button(action: {
                self.selectedTab = 4
            }){
                Image(systemName: "info.circle.fill")
                    .resizable().frame(width: 25, height: 25)
                    .padding([.leading,.trailing], 0)
                    .foregroundColor(self.selectedTab == 4 ? Color.white : Color.secondary)
                    .padding()
                    .background(self.selectedTab == 4 ? Color(#colorLiteral(red: 0.269092679, green: 0.2473217845, blue: 0.5970885754, alpha: 1)) : Color.white)
                    .cornerRadius(20)
            }
        }.padding([.leading,.trailing], 20)
            .padding()
            .background(Color.white)
    }
}


