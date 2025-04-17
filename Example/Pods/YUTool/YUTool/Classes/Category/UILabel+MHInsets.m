//
//  UILabel+MHInsets.m
//  YUTool
//
//  Created by yu on 2025/4/11.
//

#import "UILabel+MHInsets.h"
#import <objc/runtime.h>

@implementation UILabel (MHInsets)
static char kContentInsetsKey;
static char kshowContentInsetsKey;

- (void)setMh_contentInsets:(UIEdgeInsets)mh_contentInsets {
    objc_setAssociatedObject(self, &kContentInsetsKey, NSStringFromUIEdgeInsets(mh_contentInsets), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kshowContentInsetsKey, @YES, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (UIEdgeInsets)mh_contentInsets {
    return UIEdgeInsetsFromString(objc_getAssociatedObject(self, &kContentInsetsKey));
}

+ (void)load {
    [super load];
    
    // class_getInstanceMethod()
    Method fromMethod = class_getInstanceMethod([self class], @selector(drawTextInRect:));
    Method toMethod = class_getInstanceMethod([self class], @selector(mh_drawTextInRect:));
    
    // class_addMethod()
    if (!class_addMethod([self class], @selector(drawTextInRect:), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
}


- (void)mh_drawTextInRect:(CGRect)rect {
    BOOL show = objc_getAssociatedObject(self, &kshowContentInsetsKey);
    if (show) {
        rect = UIEdgeInsetsInsetRect(rect, self.mh_contentInsets);
    }
    [self mh_drawTextInRect:rect];
}


@end
