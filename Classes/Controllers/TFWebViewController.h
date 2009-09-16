//
//  FirstViewController.h
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/14/09.
//  Copyright Topfunky Corporation 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TFNewsItem;

@interface TFWebViewController : UIViewController <UIWebViewDelegate> {
  IBOutlet UIWebView *webView;
  TFNewsItem *newsItem;
}

@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) TFNewsItem *newsItem;

- (id)initWithNewsItem:(TFNewsItem *)theNewsItem;
- (void)goToURL:(NSURL *)aURL;

@end

