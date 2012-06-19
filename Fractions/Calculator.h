#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject {
    Fraction *fraction1;
    Fraction *fraction2;
}

- (Fraction *)fraction1;
- (Fraction *)fraction2;
- (void)setFraction1:(Fraction *)frac;
- (void)setFraction2:(Fraction *)frac;

-(Fraction *)add;

@end
