//
//  UIViewRepresentableBootcamp.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 26/04/23.
//

import SwiftUI

struct UIViewRepresentableBootcamp: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            HStack {
                Text("SwiftUI:")
                TextField("Type here...", text: $text)
                    .frame(height: 55)
                    .background(Color.gray)
            }
            HStack {
                Text("UIKit:    ")
                UITextFieldRepresentableView(text: $text)
                    .updatePlaceHolder("Please type here")
                    .frame(height: 55)
                    .background(Color.gray)
            }
        }
    }
}

struct UIViewRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepresentableBootcamp()
    }
}


/// A SwiftUI view that represents a UITextField from UIKit.
struct UITextFieldRepresentableView: UIViewRepresentable {
    @Binding var text: String
    var placeHolder: String
    let placeHolderColor: UIColor
    
    init(text: Binding<String>, placeHolder: String = "", placeHolderColor: UIColor = .blue) {
        self._text = text
        self.placeHolder = placeHolder
        self.placeHolderColor = placeHolderColor
    }
    
    /// Creates and returns a UITextField object.
    func makeUIView(context: Context) -> UITextField {
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    
    /// Updates the text of the text field with the value of the `text` binding.
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    /// Creates and returns a Coordinator instance that handles delegate events from the text field.
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func updatePlaceHolder(_ text: String) -> UITextFieldRepresentableView {
        var viewRepresentable = self
        viewRepresentable.placeHolder = text
        return viewRepresentable
    }
    
    /// A class that handles delegate events from the text field.
    /// We need this class only this scope, so I created this class inside struct. we normally don't do that in swiftUI
    class Coordinator: NSObject, UITextFieldDelegate {
        
        /// A binding to the text value of the text field.
        @Binding var text: String
        
        /// Initializes a new Coordinator instance with the given text binding.
        init(text: Binding<String>) {
            self._text = text
        }
        
        /// Called when the text selection changes in the text field.
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}

extension UITextFieldRepresentableView {
    private func getTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        let placeholder = NSAttributedString(
            string: placeHolder,
            attributes: [
                .foregroundColor : placeHolderColor
            ]
        )
        textField.attributedPlaceholder = placeholder
        return textField
    }
}

struct BasicUIViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
