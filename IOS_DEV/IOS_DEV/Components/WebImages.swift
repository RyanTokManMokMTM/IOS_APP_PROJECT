import SwiftUI
import SDWebImageSwiftUI
import Kingfisher



//struct testPage:View{
//    @State private var show = false
//    var body : some View{
//        NavigationView{
//            NavigationLink(
//                destination:WebImages(),
//                isActive: $show){
//
//                Button(action:{
//                    show.toggle()
//                }){
//                    Text("Show")
//                }
//            }
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//struct testPage_Previews : PreviewProvider{
//    static var previews: some View {
//        testPage()
//    }
//}

struct movieImage:View{
    var body : some View{
        WebImage(url:URL(string: "https://image.tmdb.org/t/p/original/thmDdDLQYrJJuhIYQIA4FDpi1E5.jpg"))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .overlay(
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0),Color.black.opacity(0.95)]), startPoint:.top, endPoint: .bottom)
                
            )
            .background(Color.black.edgesIgnoringSafeArea(.all))

    }
}



struct WebImages: View {
    //MOVIE URL
    @State private var size = 0.0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                GeometryReader{ proxy in
                    movieImage()
                        .offset(y:-proxy.frame(in:.global).minY)
                        .frame(width: proxy.frame(in:.global).maxX, height: proxy.frame(in:.global).minY+480)
                     //   .blur(radius:-proxy.frame(in:.global).minY / 10)
                        .brightness((-Double(proxy.frame(in:.global).minY) * -0.003) >= 0 ? 0 : -Double(proxy.frame(in:.global).minY) * -0.003)
                }
                .frame(height:480)
                //                        Detail Items
                
                MovieInfoDetail()
                    .offset(y:-150)
                
            }
            
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width)
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        
    }
}


struct WebImages_Previews: PreviewProvider {
    static var previews: some View {
        WebImages()
    }
}

struct MovieInfoDetail: View {
    @State private var isMyList = false
    
    var body: some View {
        VStack(spacing:10){
            HStack{
                Text("Movie Name")
                    .bold()
                    .font(.system(size:40))
                    .foregroundColor(.red)
            
                Spacer()
                
                HStack(spacing:5){
                    Text("9.0")
                    Image(systemName: "star.fill")
                        .renderingMode(.original)
                }
            }
            HScrollList(info: [.data,.time,.language,.rate,.type])
                .font(.system(size: 14))
            

            
            Genre(Genres: [.Action,.Adventure,.Horror])
            
            //ScrollView for more info
            VStack(alignment:.leading,spacing:5){
                HStack(alignment:.bottom){
                    Text("Description:")
                    Spacer()
                }
                
                //just support at most 5 line
                Text("電玩改編電影，新版《魔宮帝國》又名《真人快打》。體驗新世代格鬥，延續血腥暴力的風格，描述綜合格鬥選手「科爾楊」準備好跟地球最強的冠軍聯手，為了宇宙展開一場高風險戰役，並肩對抗外世界的敵人。")
                    .lineLimit(5)
                
                Spacer()
                
                HStack(spacing:10){
                    SmallRectButton(title: "Play", icon: "arrowtriangle.right.fill"){
                        //To Move to Video source page
                        print("test")
                    }
                    
                    SmallBorderOnlyButton(title: "My List", icon: "plus", onChangeIcon: "checkmark",isMylist: $isMyList){
                        //To Add this movie to my List
                        isMyList.toggle()
                    }
                    Spacer()
                    
                    SmallVerticalButton(IsOnImage: "heart.fill", IsOffImage: "heart", text: "Like", IsOn: true){
                        //TODO
                    }
                    
                    .padding(.trailing)
                    
                }
                
                Spacer()
//                
//                VerticalButton()
//                
//                Spacer()
                
                MovieDetailScrollView(tabs: [.overView,.trailer,.more,.resouces])
                Spacer()
                
            }
            .padding(.top,5)
            .font(.system(size: 14))
            .foregroundColor(Color(UIColor.systemGray3))
            
            
            
        }
        .font(.system(.title3))
        .foregroundColor(.white)
        .padding(.horizontal,10)
        .padding(.top)
        //    .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct VerticalButton: View {
    var body: some View {
        HStack(spacing:30){
            SmallVerticalButton(IsOnImage: "paperplane.fill", IsOffImage: "paperplane.fill", text: "Share", IsOn: true){
                //TODO
            }
            
            SmallVerticalButton(IsOnImage: "message.fill", IsOffImage: "message", text: "comment", IsOn: true){
                //TODO
            }
            Spacer()
        }
      //  .padding(.horizontal)
    }
}
