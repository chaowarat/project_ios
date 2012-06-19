#import <Foundation/Foundation.h>

int main(void) {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// Create a string
	NSString *string = @"Objective C Monsters";

	// Capitalise the string and add 'We are' at the beginning
	// TODO

    string = [string uppercaseString];
    string = [string stringByAppendingString:@" rock the world!"];
	// Print the string
	printf("%s\n", [string cString]);
	
	// Release memory
	[pool release];
	
	return 0;
}