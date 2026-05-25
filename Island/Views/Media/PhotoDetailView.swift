import SwiftUI

struct PhotoDetailView: View {
    let imageUrl: String
    @State private var scale: CGFloat = 1.0

    var body: some View {
        ZStack {
            Color.black
            AsyncImage(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .pinchToZoom()
                case .failure:
                    Image(systemName: "photo")
                        .foregroundColor(.white)
                default:
                    ProgressView()
                }
            }
        }
        .ignoresSafeArea()
    }
}

extension View {
    func pinchToZoom() -> some View {
        self.modifier(PinchToZoomModifier())
    }
}

struct PinchToZoomModifier: ViewModifier {
    @State private var scale: CGFloat = 1.0

    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .gesture(MagnificationGesture().onChanged { value in
                scale = value
            }.onEnded { _ in
                withAnimation { scale = 1.0 }
            })
    }
}
