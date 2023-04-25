//
//  Generics.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 25/04/23.
//

import SwiftUI

// MARK: - Generic Model
struct GenericModel<T> {
    let info: T?
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    @Published var genericStringModel = GenericModel(info: "Hello!!!")
    @Published var genericBoolModel = GenericModel(info: true)
    @Published var genericIntModel = GenericModel(info: 13)
    func removeData() {
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
        genericIntModel = genericIntModel.removeInfo()
    }
}
// MARK: - Generic View
struct GenericView<T: View>: View {
    let content: T
    let title: String
    var body: some View {
        VStack {
            Text(title)
            content
        }
    }
}

struct Generics: View {
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            GenericView(content: Text("Custom Content"), title: "New View!")
            
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericIntModel.info?.description ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                vm.removeData()
            }
        }
    }
}

struct Generics_Previews: PreviewProvider {
    static var previews: some View {
        Generics()
    }
}
