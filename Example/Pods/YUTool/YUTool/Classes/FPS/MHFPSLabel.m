//
//  MHFPSLabel.m
//  YUTool
//
//  Created by yu on 2025/4/11.
//

#define kFPSSize CGSizeMake(80, 30)

#import "MHFPSLabel.h"

@interface MHFPSLabel () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) CADisplayLink *s_displayLink;

@property (nonatomic, assign) NSUInteger s_count;

@property (nonatomic, assign) NSTimeInterval s_lastTime;

@property (nonatomic, strong) UIFont *s_font;

@property (nonatomic, strong) UIFont *s_subFont;

@end

@implementation MHFPSLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size = kFPSSize;
    }
    self = [super initWithFrame:frame];
    
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    self.textAlignment = NSTextAlignmentCenter;
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.700];
    
    self.s_font = [UIFont fontWithName:@"Menlo" size:14];
    if (self.s_font) {
        self.s_subFont = [UIFont fontWithName:@"Menlo" size:4];
    } else {
        self.s_font = [UIFont fontWithName:@"Courier" size:14];
        self.s_subFont = [UIFont fontWithName:@"Courier" size:4];
    }
    
    __weak typeof(self) weakSelf = self;
    self.s_displayLink = [CADisplayLink displayLinkWithTarget:weakSelf selector:@selector(tick:)];
    [self.s_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

    /*! NOTE:  添加手势 */
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    [self addGestureRecognizer:panGesture];
    
    return self;
}

- (void)handlePan:(UIPanGestureRecognizer *)gesture {
    // 获取手势的触摸点
    // CGPoint curP = [pan locationInView:self.imageView];
    
    // 移动视图
    // 获取手势的移动，也是相对于最开始的位置
    CGPoint transP = [gesture translationInView:self];
    
    self.transform = CGAffineTransformTranslate(self.transform, transP.x, transP.y);
    
    // 复位
    [gesture setTranslation:CGPointZero inView:self];
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        /*! NOTE:  获取屏幕宽高 */
        CGFloat windiwScreenWidth = [UIScreen mainScreen].bounds.size.width;
        [UIView animateWithDuration:0.2 animations:^{
            [self setFrame:CGRectMake((CGRectGetMinX(self.frame) - windiwScreenWidth / 2.0) > 0 ? (windiwScreenWidth - CGRectGetWidth(self.frame) - 20.f) : 20, CGRectGetMinY(self.frame) > 100 ? CGRectGetMinY(self.frame) : 100, kFPSSize.width, kFPSSize.height)];
        }];
    }
}

- (void)dealloc {
    [self.s_displayLink invalidate];
}

- (CGSize)sizeThatFits:(CGSize)size {
    return kFPSSize;
}

- (void)tick:(CADisplayLink *)link {
    if (self.s_lastTime == 0) {
        self.s_lastTime = link.timestamp;
        return;
    }
    
    self.s_count++;
    NSTimeInterval delta = link.timestamp - self.s_lastTime;
    if (delta < 1) return;
    self.s_lastTime = link.timestamp;
    float fps = self.s_count / delta;
    self.s_count = 0;
    
    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.0f FPS", round(fps)] attributes:@{NSForegroundColorAttributeName :UIColor.whiteColor, NSFontAttributeName: self.s_font}];
    [attributedString addAttributes:@{NSForegroundColorAttributeName :color} range:NSMakeRange(0, attributedString.length - 3)];
    [attributedString addAttributes:@{NSFontAttributeName: self.s_subFont} range:NSMakeRange(attributedString.length - 4, 1)];
    
    self.attributedText = attributedString;
}

@end
