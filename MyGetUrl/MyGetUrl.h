//
//  MyGetUrl.h
//  MyGetUrl
//
//  Created by Toshimi Ataku on 2020/09/28.
//  Copyright © 2020 Toshimi Ataku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyGetUrl : NSObject

@property (weak) IBOutlet NSTextField *url;
@property (weak) IBOutlet NSScrollView *contents;

- (IBAction)doFetch:(id)sender;

@end

NS_ASSUME_NONNULL_END
