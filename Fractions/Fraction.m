#import "Fraction.h"
#import <stdio.h>

@implementation Fraction

- (void)setTopNumber:(int)num {
    topNumber = num;
}

- (void)setBottomNumber:(int)num {
    bottomNumber = num;
}

- (int)topNumber {
    return topNumber;
}

- (int)bottomNumber {
    return bottomNumber;
}

- (void)print {
    float result = 1.0*topNumber / bottomNumber;
    printf("%f/%f = %.2f", topNumber, bottomNumber, result);
}

- (void)square{
    float result = 1.0*topNumber / bottomNumber;
    result = pow(result, 2);
    printf("%f/%f = %.2f", topNumber, bottomNumber, result);
}

- (void)powerOf:(int)power{
    float result = 1.0*topNumber / bottomNumber;
    result = pow(result, power);
    printf("%f/%f = %.2f", topNumber, bottomNumber, result); 
}



@end