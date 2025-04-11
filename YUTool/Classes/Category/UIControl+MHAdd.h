//
//  UIControl+MHAdd.h
//  YUTool
//
//  Created by yu on 2025/4/11.
//

/*! NOTE:  防爆击 */

#import <UIKit/UIKit.h>

@interface UIControl (MHAdd)

/*! NOTE:  添加点击事件的间隔时间 */
@property (nonatomic, assign) NSTimeInterval mh_acceptEventInterval;

/*! NOTE:  是否忽略点击事件,不响应点击事件 */
@property (nonatomic, assign) BOOL mh_ignoreEvent;

@end
