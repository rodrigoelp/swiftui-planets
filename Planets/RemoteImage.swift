//

import SwiftUI
import Network
import Combine

struct RemoteImage: View {
    @ObservedObject private var viewModel: RemoteImageViewModel

    init(url: URL?) {
        viewModel = RemoteImageViewModel(url: url)
    }

    var body: some View {
        Group {
            (viewModel
                .content
                .flatMap({ UIImage(data: $0) })
                .map({ Image(uiImage: $0) })
                ?? Image(systemName: "photo"))
                .resizable()
        }.onAppear(perform: self.viewModel.download)
    }
}

private class RemoteImageViewModel: ObservableObject {
    @Published var content: Data?
    private var disposeBag: [AnyCancellable] = []
    private let url: URL?

    init(url: URL?) {
        self.url = url
    }

    deinit {
        disposeBag.removeAll()
    }

    func download() {
        guard let url = url, content == nil else {
            return
        }

        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map({ $0.data })
            .catch({ e -> AnyPublisher<Data?, Never> in
                print("Downloading image (error): \(e.localizedDescription)")
                return Just(nil).eraseToAnyPublisher()
            })
            .receive(on: RunLoop.main)
            .assign(to: \RemoteImageViewModel.content, on: self)
            .store(in: &disposeBag)
    }
}
