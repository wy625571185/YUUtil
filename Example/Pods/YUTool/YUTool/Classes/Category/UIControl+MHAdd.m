//
//  UIControl+MHAdd.m
//  YUTool
//
//  Created by yu on 2025/4/11.
//

#import "UIControl+MHAdd.h"
#import <objc/runtime.h>

@interface UIControl ()

@property (nonatomic, assign) NSTimeInterval mh_acceptEventTime;

@end

@implementation UIControl (MHAdd)

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

static const char *UIcontrol_ignoreEvent = "UIcontrol_ignoreEvent";

static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";

- (NSTimeInterval)mh_acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setMh_acceptEventInterval:(NSTimeInterval)mh_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(mh_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)mh_ignoreEvent {
    return [objc_getAssociatedObject(self, UIcontrol_ignoreEvent) boolValue];
}

- (void)setMh_ignoreEvent:(BOOL)mh_ignoreEvent {
    objc_setAssociatedObject(self, UIcontrol_ignoreEvent, @(mh_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval )mh_acceptEventTime {
    return [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setmh_acceptEventTime:(NSTimeInterval)mh_acceptEventTime {
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(mh_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    SEL aSEL = @selector(sendAction:to:forEvent:);
    Method b = class_getInstanceMethod(self, @selector(__mh_sendAction:to:forEvent:));
    SEL bSEL = @selector(__mh_sendAction:to:forEvent:);
    
    //添加方法 语法：BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types) 若添加成功则返回No
    // cls：被添加方法的类  name：被添加方法方法名  imp：被添加方法的实现函数  types：被添加方法的实现函数的返回值类型和参数类型的字符串
    BOOL didAddMethod = class_addMethod(self, aSEL, method_getImplementation(b), method_getTypeEncoding(b));

    /*! NOTE:  如果系统中该方法已经存在了，则替换系统的方法  语法：IMP class_replaceMethod(Class cls, SEL name, IMP imp,const char *types) */
    if (didAddMethod) {
        class_replaceMethod(self, bSEL, method_getImplementation(a), method_getTypeEncoding(a));
    }else{
        method_exchangeImplementations(a, b);
    }
}

- (void)__mh_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (self.mh_ignoreEvent) return;
    
    if (self.mh_acceptEventInterval > 0) {
        /*! NOTE:  是否小于设定的时间间隔 */
        BOOL needSendAction = (NSDate.date.timeIntervalSince1970 - self.mh_acceptEventTime >= self.mh_acceptEventInterval);
        /*! NOTE:  更新上一次点击时间戳 */
        self.mh_acceptEventTime = NSDate.date.timeIntervalSince1970;
        /*! NOTE:  两次点击的时间间隔小于设定的时间间隔时，才执行响应事件 */
        if (needSendAction) {
            [self __mh_sendAction:action to:target forEvent:event];
        }
        return;
    }
    
    [self __mh_sendAction:action to:target forEvent:event];
}

@end
