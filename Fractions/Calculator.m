#import "Calculator.h"
#import <stdio.h>
@implementation Calculator

- (Fraction *)fraction1{
    return fraction1;
}

- (Fraction *)fraction2{
    return fraction2;
}

- (void)setFraction1:(Fraction *)frac{
    fraction1 = frac;
}

- (void)setFraction2:(Fraction *)frac{
    fraction2 = frac;
}

-(Fraction *)add{
    float result1 = 1.0*[fraction1 topNumber] / [fraction1 bottomNumber];
    float result2 = 1.0*[fraction2 topNumber] / [fraction2 bottomNumber];
    
    Fraction *frac = [[Fraction alloc] init];
    
    [frac setTopNumber:result1 + result2];
    [frac setBottomNumber:1];
    //printf("Calculat = %f + %f", result1, result2);
    return frac;
}

@end
