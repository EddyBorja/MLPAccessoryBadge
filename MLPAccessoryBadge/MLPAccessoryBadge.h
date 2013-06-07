/*
//  MLPAccessoryBadge.h
//
//  Created by Eddy Borja on 4/8/13.
//  Copyright (c) 2013 Mainloop LLC. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#import <UIKit/UIKit.h>


@interface MLPAccessoryBadge : UIView
@property (weak, readonly) UILabel *textLabel;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeWidth;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *highlightColor; //default is white
@property (nonatomic, assign) CGFloat highlightAlpha;
@property (nonatomic, assign) CGFloat shadowAlpha;
@property (nonatomic, assign) CGSize shadowOffset;
@property (nonatomic, assign) CGFloat gradientAlpha;
@property (nonatomic, assign) CGSize textLabelOffset;
@property (nonatomic, assign) CGSize textSizePadding;
@property (nonatomic, assign) CGSize badgeInnerPadding;
@property (nonatomic, assign) CGSize badgeContentInset;
@property (nonatomic, assign) CGSize badgeMinimumSize;

@property (nonatomic, strong) UIColor *chevronColor;
@property (nonatomic, assign, getter = isBadgeHidden) BOOL badgeHidden;
@property (nonatomic, assign) CGFloat chevronStrokeWidth;

- (void)setText:(NSString *)string;
- (void)setTextWithNumber:(NSNumber *)number;
- (void)setTextWithIntegerValue:(NSInteger)value;
- (void)setTextColor:(UIColor *)color;
@end

@interface MLPAccessoryBadgeArrow : MLPAccessoryBadge
@end

@interface MLPAccessoryBadgeChevron : MLPAccessoryBadge
//If this is nil, the background color of the badge is used by default.
@end

@interface MLPAccessoryBadgeEmboss : MLPAccessoryBadge
@end


