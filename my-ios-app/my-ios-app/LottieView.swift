import SwiftUI
import Lottie

public struct LottieView: UIViewRepresentable {
    var animationView: LottieAnimationView
    var loopMode: LottieLoopMode
    
    
    public init(animationView: LottieAnimationView, loopMode: LottieLoopMode = LottieLoopMode.loop) {
        self.animationView = animationView
        self.loopMode = loopMode
    }
    
    public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        animationView.contentMode = .scaleAspectFit
        
        animationView.loopMode = .loop
        animationView.play()
    
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
           ])
        
        animationView.layer.setValue(true, forKey: "renderInContext")
        return view
    }
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}
