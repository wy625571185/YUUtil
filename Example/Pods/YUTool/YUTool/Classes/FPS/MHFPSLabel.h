//
//  MHFPSLabel.h
//  YUTool
//
//  Created by yu on 2025/4/11.
//

/*! NOTE:  显示刷新率,使用方法如下
    @property (nonatomic, strong) MHFPSLabel *s_fpsLabel;

    self.s_fpsLabel = [MHFPSLabel new];
    [self.s_fpsLabel sizeToFit];
    self.s_fpsLabel.bottom = 100;
    self.s_fpsLabel.left = 10;
    self.s_fpsLabel.alpha = 1;
    [self.view addSubview:self.s_fpsLabel];
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MHFPSLabel : UILabel

@end

NS_ASSUME_NONNULL_END
