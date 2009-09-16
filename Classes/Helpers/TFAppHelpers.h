//
//  TFAppHelpers.h
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/18/09.
//  Copyright 2009 Topfunky Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

void TFAlertWithMessageAndDelegate(NSString *message, id theDelegate);
void TFAlertWithErrorAndDelegate(NSError *error, id theDelegate);

void TFLogRect(NSString *message, CGRect rect);
void TFLogSize(NSString *message, CGSize size);
