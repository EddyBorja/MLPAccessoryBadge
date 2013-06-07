/*
//  MLPAccessoryBadge.m
//
//  Created by Eddy Borja on 4/8/13.
//  Copyright (c) 2013 Mainloop LLC. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#import "MLPAccessoryBadge.h"
#import <QuartzCore/QuartzCore.h>


@interface MLPAccessoryBadge ()
@property (weak, readwrite) UILabel *textLabel;

- (CGFloat)luminanceValueForColor:(UIColor *)color;
@end

#pragma mark - MLPAccessoryBadge
@implementation MLPAccessoryBadge

- (id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    [self setCornerRadius:4];
    [self setHighlightAlpha:0.45];
    [self setShadowAlpha:0.1];
    [self setShadowOffset:CGSizeMake(0, 1)];
    [self setStrokeWidth:2];
    [self setBackgroundColor:[UIColor grayColor]];
    [self setTextSizePadding:CGSizeMake(16, 0)];
    [self setBadgeMinimumSize:CGSizeMake(30, 22)];
    [self setGradientAlpha:0.14];
    [self setOpaque:NO];
    
    [self loadTextLabel];
    
    [self setFrame:self.textLabel.frame];
    
    [self setShadow];
    [self setNeedsDisplay];
}



#pragma mark - Loading

- (void)loadTextLabel
{
    UILabel *newTextLabel = [self newTextLabel];
    [self addSubview:newTextLabel];
    [self setTextLabel:newTextLabel];
}


#pragma mark - Setters

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    [self resizeFrame];
    [self setNeedsDisplay];
}

- (void)setHighlightAlpha:(CGFloat)alpha
{
    _highlightAlpha = alpha;
    [self setNeedsDisplay];
}

- (void)setShadowAlpha:(CGFloat)alpha
{
    _shadowAlpha = alpha;
    [self setShadow];
    [self setNeedsDisplay];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    [self setNeedsDisplay];
}

- (void)setBadgeInnerPadding:(CGSize)badgeInnerPadding
{
    _badgeInnerPadding = badgeInnerPadding;
    [self resizeFrame];
    [self setNeedsDisplay];
}

- (void)setBadgeMinimumSize:(CGSize)badgeMinimumSize
{
    _badgeMinimumSize = badgeMinimumSize;
    [self resizeFrame];
    [self setNeedsDisplay];
}

- (void)setGradientAlpha:(CGFloat)gradientAlpha
{
    _gradientAlpha = gradientAlpha;
    [self setNeedsDisplay];
}

- (void)setTextLabelOffset:(CGSize)textLabelOffset
{
    _textLabelOffset = textLabelOffset;
    [self resizeFrame];
    [self setNeedsDisplay];
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
    _shadowOffset = shadowOffset;
    [self setNeedsDisplay];
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
    _strokeColor = strokeColor;
    [self setNeedsDisplay];
}

- (void)setStrokeWidth:(CGFloat)strokeWidth
{
    _strokeWidth = strokeWidth;
    [self setNeedsDisplay];
}


- (void)setChevronColor:(UIColor *)chevronColor
{
    _chevronColor = chevronColor;
    [self setNeedsDisplay];
}

- (void)setBadgeHidden:(BOOL)badgeHidden
{
    _badgeHidden = badgeHidden;
    [self setNeedsDisplay];
    [self setShadow];
}

- (void)setChevronStrokeWidth:(CGFloat)chevronStrokeWidth
{
    _chevronStrokeWidth = chevronStrokeWidth;
    [self setNeedsDisplay];
}

- (void)setTextWithNumber:(NSNumber *)number
{
    [self setTextWithIntegerValue:[number integerValue]];
}

- (void)setTextWithIntegerValue:(NSInteger)value
{
    [self setText:[NSString stringWithFormat:@"%i", value]];
}

- (void)setText:(NSString *)string
{
    NSAssert(self.textLabel, @"Must have a textlabel to set!");
    [self.textLabel setText:string];
    [self resizeFrame];
}

- (void)setTextColor:(UIColor *)color
{
    [self.textLabel setTextColor:color];
    
    CGFloat luminance = [self luminanceValueForColor:color];
    
    if(luminance < 0.5){
        [self.textLabel setShadowColor:[UIColor colorWithWhite:1 alpha:0.20]];
        [self.textLabel setShadowOffset:CGSizeMake(0, 1)];
    } else {
        [self.textLabel setShadowColor:[UIColor colorWithWhite:0 alpha:0.15]];
        [self.textLabel setShadowOffset:CGSizeMake(0, -1)];
    }
}

- (void)setShadow
{
    [self.layer setShadowOffset:self.shadowOffset];
    [self.layer setShadowOpacity:self.shadowAlpha];
    [self.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.layer setShadowRadius:0];
    UIBezierPath *shadowPath = [self accessoryPathInRect:self.frame];
    [self.layer setShadowPath:[shadowPath CGPath]];
}

- (void)setNeedsLayout
{
    [super setNeedsLayout];
    [self resizeFrame];
}



- (UIBezierPath *)accessoryPathInRect:(CGRect)rect
{
    if(self.isBadgeHidden){
        return nil;
    }
    
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                               cornerRadius:self.cornerRadius];
    return roundedRectPath;
}

#pragma mark - Event

- (void)resizeFrame
{
    CGSize size = [self.textLabel.text sizeWithFont:self.textLabel.font];
    size.width += self.textSizePadding.width;
    size.height += self.textSizePadding.height;
    
    CGRect resizeFrame = CGRectMake(0,
                                    0,
                                    MAX(size.width, self.badgeMinimumSize.width),
                                    MAX(size.height, self.badgeMinimumSize.height));
    
    resizeFrame.origin.x += self.textLabelOffset.width;
    resizeFrame.origin.y += self.textLabelOffset.height;
    
    [self.textLabel setFrame:resizeFrame];
        
    resizeFrame.size.width += self.badgeInnerPadding.width;
    resizeFrame.size.height += self.badgeInnerPadding.height;
    [self setFrame:CGRectInset(resizeFrame,
                               self.badgeContentInset.width,
                               self.badgeContentInset.height)];
    
    [self setShadow];
}

#pragma mark - Helpers

- (CGFloat)luminanceValueForColor:(UIColor *)color
{
    //Y = 0.2126 R + 0.7152 G + 0.0722 B (Luminance Formula for SRGB)
    const CGFloat redWeight = 0.2126;
    const CGFloat greenWeight = 0.7152;
    const CGFloat blueWeight = 0.0722;
    
    CGFloat rgbValues[4];
    [color getRed:&rgbValues[0] green:&rgbValues[1] blue:&rgbValues[2] alpha:&rgbValues[4]];
    
    
    CGFloat luminance = (rgbValues[0] * redWeight) +
    (rgbValues[1] * greenWeight) +
    (rgbValues[2] * blueWeight);
    
    return luminance;
}


#pragma mark - Factory Methods

- (UILabel *)newTextLabel
{
    UILabel *newTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 22)];
    [newTextLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [newTextLabel setTextAlignment:NSTextAlignmentCenter];
    [newTextLabel setTextColor:[UIColor whiteColor]];
    [newTextLabel setShadowColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [newTextLabel setShadowOffset:CGSizeMake(0, -1)];
    [newTextLabel setBackgroundColor:[UIColor clearColor]];

    return newTextLabel;
}



- (void)drawRect:(CGRect)rect
{
    if(self.isBadgeHidden){
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *bezierPath = [self accessoryPathInRect:self.bounds];
    CGPathRef path = [bezierPath CGPath];
    
    //Fill in the background
    CGContextAddPath(context, path);
    CGContextSetFillColorWithColor(context, [self.backgroundColor CGColor]);
    CGContextFillPath(context);
    
    //New Clipping Path
    CGContextAddPath(context, path);
    CGContextClip(context);
        
    //Create a surface gradient
    CGMutablePathRef outerRectPath = CGPathCreateMutable();
    CGPathAddRect(outerRectPath, NULL, CGRectInset(rect, -30, -30));
    CGPathAddPath(outerRectPath, NULL, path);
    CGPathCloseSubpath(outerRectPath);
    
    CGContextSetBlendMode(context, kCGBlendModeMultiply);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    CGFloat components[8] =	{ 0.0, 0.0, 0.0, 0.0,
                              0.0, 0.0, 0.0, self.gradientAlpha };
    CGGradientRef gradientRef = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    
    CGPoint startPoint = CGPointMake(CGRectGetMaxX(rect)*0.5, CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect)*0.5, CGRectGetMaxY(rect));
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation);
    
    //Stroke the path
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    if(self.strokeColor){
        CGContextAddPath(context, path);
        CGContextSetStrokeColorWithColor(context, [self.strokeColor CGColor]);
        CGContextSetLineWidth(context, self.strokeWidth);
        CGContextStrokePath(context);
    }
    
    //Draw the higlight bevel
    CGContextSetBlendMode(context, kCGBlendModeSoftLight);
    UIColor *highlightColor = self.highlightColor ? self.highlightColor :
                                [UIColor colorWithWhite:1.0 alpha:self.highlightAlpha];
    CGContextSetShadowWithColor(context, self.shadowOffset, 0.0, [highlightColor CGColor]);
    CGContextAddPath(context, outerRectPath);
    CGContextEOFillPath(context);
    
    CGPathRelease(outerRectPath);
}
@end


#pragma mark -
#pragma mark -
#pragma mark - MLPAccessoryBadgeArrow
@implementation MLPAccessoryBadgeArrow

- (void)initialize
{
    [super initialize];
    [self setBadgeInnerPadding:CGSizeMake(10, 0)];
}

- (void)resizeFrame
{
    [super resizeFrame];
    
    [self.textLabel setCenter:CGPointMake(self.center.x-(10*0.25), self.center.y)];
    
    [self setShadow];
}

- (void)setShadow
{
    [super setShadow];
    UIBezierPath *shadowPath = [self accessoryPathInRect:self.frame];
    [self.layer setShadowPath:[shadowPath CGPath]];
}

- (UIBezierPath *)accessoryPathInRect:(CGRect)rect
{
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    //the starting point, top left corner
    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect) + self.cornerRadius, CGRectGetMinY(rect));
    
    //draw the arrow
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect)-10, CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMidY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect)-10, CGRectGetMaxY(rect));
    
    //bottom left corner
    CGPathAddArc(path, NULL, CGRectGetMinX(rect) + self.cornerRadius, CGRectGetMaxY(rect) - self.cornerRadius, self.cornerRadius, (float)M_PI / 2, (float)M_PI, 0);
    
    //top left corner, the ending point
    CGPathAddArc(path, NULL, CGRectGetMinX(rect) + self.cornerRadius, CGRectGetMinY(rect) + self.cornerRadius, self.cornerRadius, (float)M_PI, 3 * (float)M_PI / 2, 0);
    
    //we are done
    CGPathCloseSubpath(path);

    
    return [UIBezierPath bezierPathWithCGPath:path];
}
@end


#pragma mark -
#pragma mark -
#pragma mark - MLPAccessoryBadgeChevron
@implementation MLPAccessoryBadgeChevron

- (void)initialize
{
    [super initialize];
    [self setTextSizePadding:CGSizeMake(12, 0)];
    [self setBadgeInnerPadding:CGSizeMake(18, 0)];
    [self setBadgeMinimumSize:CGSizeMake(22, 22)];
    [self setChevronStrokeWidth:4];
}

- (void)setShadow
{
    [super setShadow];
    UIBezierPath *shadowPath = [self accessoryPathInRect:self.frame];
    [self.layer setShadowPath:[shadowPath CGPath]];
}


- (UIBezierPath *)accessoryPathInRect:(CGRect)rect
{
    if(self.isBadgeHidden){
        return nil;
    }
    
    rect.size.width -= 17;
    
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                               cornerRadius:self.cornerRadius];
    return roundedRectPath;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);

    CGContextMoveToPoint(context, CGRectGetMaxX(rect) - 9, CGRectGetMinY(rect)+6);
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect)-4, CGRectGetMidY(rect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect) - 9, CGRectGetMaxY(rect)-6);
    
    CGContextSaveGState(context);
    UIColor *chevronColor = self.chevronColor ? self.chevronColor : self.backgroundColor;
    CGContextSetStrokeColorWithColor(context, [chevronColor CGColor]);
    CGContextSetShadowWithColor(context, self.shadowOffset, 0.0, [[UIColor colorWithWhite:0 alpha:self.shadowAlpha] CGColor]);
    CGContextSetLineWidth(context, self.chevronStrokeWidth);
    CGContextSetLineJoin(context, kCGLineJoinMiter);
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
    [super drawRect:rect];
}
@end


#pragma mark -
#pragma mark -
#pragma mark - MLPAccessoryBadgeEmboss
@implementation MLPAccessoryBadgeEmboss

- (void)initialize
{
    [super initialize];
    [self setTextLabelOffset:CGSizeMake(2, 2)];
    [self setBadgeContentInset:CGSizeMake(-2, -2)];
}

- (void)setShadow
{
    [super setShadow];
    
    CGRect badgeRect = CGRectInset(self.frame, 2, 2);
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:badgeRect
                                                               cornerRadius:self.cornerRadius];
    [self.layer setShadowPath:[shadowPath CGPath]];
}


- (UIBezierPath *)accessoryPathInRect:(CGRect)rect
{
    if(self.isBadgeHidden){
        return nil;
    }
    
    CGRect badgeRect = CGRectInset(rect, 2, 2);
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:badgeRect
                                                               cornerRadius:self.cornerRadius];
    return roundedRectPath;
}


- (void)drawRect:(CGRect)rect
{
    if(self.isBadgeHidden){
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                               cornerRadius:self.cornerRadius+1];
    CGPathRef path = [roundedRectPath CGPath];

    //Fill in the blackground
    CGContextAddPath(context, path);
    CGContextClip(context);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    CGFloat components[8] =	{ 0.0, 0.0, 0.0, 0.2,    1.0, 1.0, 1.0, 0.09 };
    CGGradientRef gradientRef = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    
    CGPoint startPoint = CGPointMake(CGRectGetMaxX(rect)*0.5, CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect)*0.5, CGRectGetMaxY(rect));
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, kCGGradientDrawsAfterEndLocation);
   
    
    CGRect badgeRect = CGRectInset(rect, 2, 2);
    
    
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradientRef);
    
    [super drawRect:badgeRect];
}
@end








