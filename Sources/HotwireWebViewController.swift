import UIKit
import WebKit

/// A base controller to use or subclass that handles Strada lifecycle callbacks.
/// Use `Hotwire.registerStradaComponents(_:)` to register Strada components.
open class HotwireWebViewController: VisitableViewController, BridgeDestination {
    public lazy var bridgeDelegate = BridgeDelegate(
        location: visitableURL.absoluteString,
        destination: self,
        componentTypes: Hotwire.stradaComponentTypes
    )

    // MARK: View lifecycle

    override open func viewDidLoad() {
        super.viewDidLoad()
        bridgeDelegate.onViewDidLoad()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bridgeDelegate.onViewWillAppear()
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bridgeDelegate.onViewDidAppear()
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        bridgeDelegate.onViewWillDisappear()
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        bridgeDelegate.onViewDidDisappear()
    }

    // MARK: Visitable

    override open func visitableDidActivateWebView(_ webView: WKWebView) {
        bridgeDelegate.webViewDidBecomeActive(webView)
    }

    override open func visitableDidDeactivateWebView() {
        bridgeDelegate.webViewDidBecomeDeactivated()
    }
}
