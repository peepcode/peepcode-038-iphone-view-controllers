//
//  TFThumbnailViewController.h
//  News
//
//  Created by Geoffrey Grosenbach on 8/27/09.
//  Copyright 2009 Topfunky Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Models/TFNewsItem.h"
#import "../Views/TFThumbnailView.h"

@interface TFThumbnailViewController : UIViewController <TFNewsItemDelegate, TFThumbnailViewDelegate> {
  NSArray *newsItems;
  UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, retain) NSArray *newsItems;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;

- (void)loadData;

@end

