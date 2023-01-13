@objc(PageControlViewManager)
class PageControlViewManager: RCTViewManager {

  override func view() -> (PageControlView) {
    return PageControlView()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return false
  }
}

class PageControlView : UIView {

  let pageControl = UIPageControl()

  init() {
    super.init(frame: CGRect.zero)
    self.addSubview(pageControl)
    
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    pageControl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

    pageControl.addTarget(self, action: #selector(pageControlHandle), for: .valueChanged)
    pageControl.addTarget(self, action: #selector(pageControlHandle), for: .touchUpInside)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc var currentPage: Int = 0 {
    didSet {
      self.pageControl.currentPage = currentPage
    }
  }

  @objc var numberOfPages: Int = 0 {
    didSet {
      self.pageControl.numberOfPages = numberOfPages
    }
  }

  @objc var hidesForSinglePage: Bool = false {
    didSet {
      self.pageControl.hidesForSinglePage = hidesForSinglePage
    }
  }

  @objc var pageIndicatorTintColor: String = "#D3D3D3" {
    didSet {
      self.pageControl.pageIndicatorTintColor = pageIndicatorTintColor.color
    }
  }

  @objc var currentPageIndicatorTintColor: String = "#ff0067" {
    didSet {
      self.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor.color
    }
  }

  @objc var onPageChange: RCTBubblingEventBlock?

  @objc func pageControlHandle(sender: UIPageControl) {
    self.onPageChange?([
      "currentPage": sender.currentPage
    ])
  }

}

extension String {

var color: UIColor {
    let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

    if #available(iOS 13, *) {
        //If your string is not a hex colour String then we are returning white color. you can change this to any default colour you want.
        guard let int = Scanner(string: hex).scanInt32(representation: .hexadecimal) else { return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) }

        let a, r, g, b: Int32
        switch hex.count {
        case 3:     (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
        case 6:     (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
        case 8:     (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
        default:    (a, r, g, b) = (255, 0, 0, 0)
        }

        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)

    } else {
        var int = UInt32()

        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3:     (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
        case 6:     (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
        case 8:     (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
        default:    (a, r, g, b) = (255, 0, 0, 0)
        }

        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
    }
  }
}
