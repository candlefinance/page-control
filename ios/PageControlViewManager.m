#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(PageControlViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(currentPage, NSInteger)

RCT_EXPORT_VIEW_PROPERTY(numberOfPages, NSInteger)

RCT_EXPORT_VIEW_PROPERTY(hidesForSinglePage, BOOL)

RCT_EXPORT_VIEW_PROPERTY(onPageChange, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(pageIndicatorTintColor, NSString)

RCT_EXPORT_VIEW_PROPERTY(currentPageIndicatorTintColor, NSString)

@end
