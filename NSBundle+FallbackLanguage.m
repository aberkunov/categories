//
//  NSBundle+FallbackLanguage.m
//  Created by Alex Berkunov
//
//  The MIT License (MIT)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "NSBundle+FallbackLanguage.h"
#import "AppDelegate.h"

@implementation NSBundle (FallbackLanguage)

- (NSString *)localizedStringForKey:(NSString *)key replaceValue:(NSString *)comment {
    
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    NSString *localizedString;
    if ([@[@"en", @"de", @"fr"] containsObject:language]){
        localizedString = [[NSBundle mainBundle] localizedStringForKey:key value:@"" table:nil];
    }
    else{
        NSString *fallbackLanguage = @"en";
        NSString *falbackBundlePath = [[NSBundle mainBundle] pathForResource:fallbackLanguage ofType:@"lproj"];
        NSBundle *fallbackBundle = [NSBundle bundleWithPath:falbackBundlePath];
        NSString *fallbackString = [fallbackBundle localizedStringForKey:key value:comment table:nil];
        
        localizedString = fallbackString;
    }
    
    return localizedString;
}

@end
