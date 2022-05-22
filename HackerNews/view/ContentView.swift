import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetrworkManager()
    
    var body: some View{
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url))
                {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationTitle("Hacker news")
            
        }
        .onAppear{
            self.networkManager .fetchData()
        }
    }
}

struct Content_preview: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}



