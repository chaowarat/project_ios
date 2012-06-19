#import <stdio.h>
#import "Fraction.h"
#import "Calculator.h"

int main(int argc, const char *argv[]) {

    // Create a new instance
    Fraction *frac = [[Fraction alloc] init];
    
    //Input number
    int topNumber, bottomNumber;
    printf("Enter the top number:");
    scanf("%i", &topNumber);
    printf("Enter the bottom number:");
    scanf("%i", &bottomNumber);

    // Set the values
    [frac setTopNumber:topNumber];
    [frac setBottomNumber:bottomNumber];

    /*
    // Print the values
    printf("The fraction is: ");
    [frac print];
    printf("\n");
    
    // Print the values new 
    printf("The square is: ");
    [frac square];
    printf("\n");
    
    //PowerOf
    printf("Enter power number: ");
    int pow;
    scanf("%i", &pow);
    [frac powerOf:pow];
    printf("\n");
     */
    
    //Input number
    int topNumber2, bottomNumber2;
    printf("Enter the top number2:");
    scanf("%i", &topNumber2);
    printf("Enter the bottom number2:");
    scanf("%i", &bottomNumber2);
    
    Fraction *frac2 = [[Fraction alloc] init];
    // Set the values
    [frac2 setTopNumber:topNumber2];
    [frac2 setBottomNumber:bottomNumber2];
    Calculator *cal = [[Calculator alloc] init];
    [cal setFraction1:frac];
    [cal setFraction2:frac2];
    Fraction *result = [cal add];
    [result print];
    printf("\n");


    // Free memory
    [frac release];
    [frac2 release];
    [cal release];

    return 0;
}
