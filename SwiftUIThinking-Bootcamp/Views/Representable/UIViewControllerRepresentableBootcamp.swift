//
//  UIViewControllerRepresentableBootcamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 27/04/23.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
    @State private var showScreen: Bool = false
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            Button {
                showScreen.toggle()
            } label: {
                Text("Click here")
            }
            .sheet(isPresented: $showScreen) {
                UIImagePickerRepresentableView(image: $image, showScreen: $showScreen)
                // BasicUIViewControllerRepresentableView(labelText: "New Text")
            }
        }
    }
}

struct UIViewControllerRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerRepresentableBootcamp()
    }
}

struct UIImagePickerRepresentableView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var showScreen: Bool
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
        return vc
    }
    // from swiftUI to UIKit
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    // from UIKit to swiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showScreen: $showScreen)
    }
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var image: UIImage?
        @Binding var showScreen: Bool
        init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
            self._image = image
            self._showScreen = showScreen
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else {
                return
            }
            self.image = newImage
            showScreen.toggle()
        }
    }
}

struct BasicUIViewControllerRepresentableView: UIViewControllerRepresentable {
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = MyFirstViewController()
        viewController.labelText = self.labelText
        return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

final class MyFirstViewController: UIViewController {
    var labelText: String = "Starting Value"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        
        view.addSubview(label)
        label.frame = view.frame
    }
}


