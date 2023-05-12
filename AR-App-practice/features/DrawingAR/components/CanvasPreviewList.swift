import SwiftUI

struct CanvasPreviewList:View{
    private var drawingDataList:[DrawingData]
    
    let columns = [GridItem(.fixed(150)),GridItem(.fixed(150))]

    init(drawingDataList: [DrawingData]) {
        self.drawingDataList = drawingDataList
    }
    
    var body:some View{
       
        NavigationStack{
            ScrollView() {
                LazyVGrid(columns: columns) {
                    ForEach([DrawingData](drawingDataList.reversed())){data in
                        NavigationLink(destination: CanvasContentView(drawingData: data)){
                            CanvasPreview(imageData: data.canvas).padding(10)
                        }
                        
                    }
                }
            }
        }
           
    }
    
}
