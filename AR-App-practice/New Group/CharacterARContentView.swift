import SwiftUI
import RealityKit


struct CharacterARContentView : View {
    
   
    @State private var showWord = "";
    @State private var selection:String = COLORS[0]
    @State private var color:UIColor=stringColorToUIColor(color: COLORS[0]);
    
    
    var body: some View {
        NavigationStack{
            
            Form{
                TextField("表示させる文字を入力してください",text:$showWord)
            }.frame(height: 100)
            
            Form{
                Picker( "色を選択",selection: $selection) {
                    ForEach(COLORS,id: \.self){color in
                        Text(color).tag(color)
                    }
                }.pickerStyle(.navigationLink)
            }.frame(height:100)
            
            
            NavigationLink(
                destination: CharacterARView(
                showWord: showWord,
                color: color
            )) {
                BlueText(
                    label: "AR表示",
                    width: 180,
                    heigth: 60
                )
            }
           
        }
    }
}




#if DEBUG
struct CharacterARContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
