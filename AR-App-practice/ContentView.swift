import SwiftUI
import Foundation


struct ContentView : View {
	
	@EnvironmentObject var drawingDataSource:DrawingDataSource
	@State private var drawingData:DrawingData? = nil
	@State private var isAddView = false

    var body: some View {
		
		VStack{
			NavigationStack{
				HStack(spacing: 30){
					Spacer()					
					Button(action:{
						let d = DrawingData(id:UUID(),userID: "dd", title: "TEST", canvas: nil, pencilData: nil, registrationDate: Date(), upDateDate: Date())
						drawingData=d
						drawingDataSource.add(new: d)
						isAddView.toggle()
					}){
						Image(systemName: "plus.circle")
							.resizable()
							.frame(width: 30, height: 30)
					}.navigationDestination(isPresented: $isAddView) {
						if let unwrappedDrawingData=drawingData{
							CanvasContentView(drawingData: unwrappedDrawingData)
						}
					
					}

				}.padding(.top, 10).padding(.trailing, 30).padding(.bottom,20)
			
				NormalHeader(text: "お絵描き一覧").padding(.bottom,20)
				
				Divider()
				
				if drawingDataSource.drawingDataList.isEmpty{
					Text("まだ、絵はありません。")
					Spacer().frame(height: 10)
					Text("画面の右上にある＋ボタンから、")
					Text("絵を追加しましょう。")
				}else{
					CanvasPreviewList(drawingDataList: drawingDataSource.drawingDataList)
				}
				Spacer()
				
			}
			
		}
		
    }
}




#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
