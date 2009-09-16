//
//  TFNewsDetailTableViewController.h
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/17/09.
//  Copyright 2009 Topfunky Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TFNewsItem;

@interface TFNewsDetailTableViewController : UITableViewController {
  TFNewsItem *newsItem;
}

@property (nonatomic, retain) TFNewsItem *newsItem;

- (id)initWithNewsItem:(TFNewsItem *)theNewsItem;

@end
