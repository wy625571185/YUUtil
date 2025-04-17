//
//  NSURLSession+MHAdd.m
//  YUTool
//
//  Created by yu on 2025/4/11.
//

#import "NSURLSession+MHAdd.h"
#import <objc/runtime.h>

void swizzing(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

@implementation NSURLSession (MHAdd)

+ (void)load {
#ifdef DEBUG
#else
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [NSURLSession class];
        swizzing(class, @selector(sessionWithConfiguration:), @selector(qy_sessionWithConfiguration:));

        swizzing(class, @selector(sessionWithConfiguration:delegate:delegateQueue:),
                 @selector(qy_sessionWithConfiguration:delegate:delegateQueue:));
    });
#endif
}

+ (NSURLSession *)qy_sessionWithConfiguration:(NSURLSessionConfiguration *)configuration
                                     delegate:(nullable id<NSURLSessionDelegate>)delegate
                                delegateQueue:(nullable NSOperationQueue *)queue {
    if (!configuration) {
        configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    }

    configuration.connectionProxyDictionary = @{};
    return [self qy_sessionWithConfiguration:configuration delegate:delegate delegateQueue:queue];
}

+ (NSURLSession *)qy_sessionWithConfiguration:(NSURLSessionConfiguration *)configuration {
    if (configuration) {
        configuration.connectionProxyDictionary = @{};
    }

    return [self qy_sessionWithConfiguration:configuration];
}

@end
