README

To compile the Fractions program on Windows with GNUstep:
gcc `gnustep-config --objc-flags` -o frac Fraction.m main.m -L /GNUstep/System/Library/Libraries -lobjc -lgnustep-base

If you want to find the files on the Windows file system, the default location is:
C:\GNUstep\msys\1.0\home\student
