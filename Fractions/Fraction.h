#import <Foundation/Foundation.h>

@interface Fraction : NSObject {
    float topNumber;
    float bottomNumber;
}

- (void)setTopNumber:(int)num;
- (void)setBottomNumber:(int)num;
- (int)topNumber;
- (int)bottomNumber;

- (void)square;
- (void)powerOf:(int)power;

- (void)print;

@end
