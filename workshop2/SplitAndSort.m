#import <Foundation/Foundation.h>

int main(void) {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// Create a string
	NSString *input = @"today,you,will,all,become,monsters";
	printf("Input string: %s\n", [input cString]);

	// Convert the string to an array
	NSArray *arr = [input componentsSeparatedByString:@","];
    
    //Sort array
    [arr sortUsingSelector:@selector(compare:)];
	
	// Loop over the array, and print out each string
    int i;
	for(i = 0; i < [arr count]; i++){
        printf("%s\n", [[arr objectAtIndex:i] cString]);
    }
	
	// Release memory
	[pool release];
	
	return 0;
}