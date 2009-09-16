//
//  TFNewsListTableViewController.h
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/15/09.
//  Copyright 2009 Topfunky Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Models/TFNewsItem.h"

@interface TFNewsListTableViewController : UITableViewController <TFNewsItemDelegate> {
  NSArray *newsItems; 
  UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, retain) NSArray *newsItems;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;

@end
