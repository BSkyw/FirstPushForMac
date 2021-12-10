//
//  TZView.m
//  FirstPush
//
//  Created by Wky on 2020/4/27.
//  Copyright © 2020 wangky. All rights reserved.
//
#include <fstream>

#import "TZView.h"
#import <WebKit/WebKit.h>
#include <iostream>

@implementation TZView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.opaque = NO;
        self.layer.opaque = NO;
    }
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType,nil]];
     if(_isDragIn) {
       NSLog(@"拖拽了");
    }
}

- (NSDragOperation)draggingEntered:(id)sender
{

    _isDragIn=YES;

    [self setNeedsDisplay:YES];

    return NSDragOperationCopy;
}

- (void)draggingExited:(id)sender
{

    _isDragIn=NO;

    [self setNeedsDisplay:YES];

}

- (BOOL)prepareForDragOperation:(id)sender
{
    _isDragIn=NO;

    [self setNeedsDisplay:YES];

    return YES;
}

- (BOOL)performDragOperation:(id)sender
{

if([sender draggingSource] !=self)

{

    NSArray* filePaths = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    
//    WebView *web = [[WebView alloc] initWithFrame:self.frame];
//    [self addSubview:web];
//    web.mainFrameURL = @"https://www.baidu.com/";

//    NSImageView *imgView = [[NSImageView alloc]initWithFrame:NSMakeRect(0, 0, 300, 300)];
//    NSImage * image = [NSImage imageNamed:filePaths[0]];
////    NSImage * image = [[NSImage alloc]initWithContentsOfFile:filePaths[0]];
//
//    [imgView setImage:image];
//    NSImage *imge = [NSImage imageNamed:filePaths[0]];
    NSImage *imge = [[NSImage alloc]initWithContentsOfFile:filePaths[0]];
//
    NSData *imageData = [imge TIFFRepresentation];
    NSString *filePath = [filePaths[0] stringByReplacingOccurrencesOfString:@"png" withString:@"jpg" ];

    std::string aa = [filePath UTF8String];

    std::ofstream f(aa.c_str(), std::ios::out | std::ios::binary | std::ios::app);

    if(!f.is_open()) {
        NSLog(@"-----errot--");
    }
    char  *data = "12345678";
    char* a= (char*)[imageData bytes];
    f.write(a, strlen(a));
    NSLog(@"文件地址%@",filePaths);
//    [self addSubview:imgView];
    }

    return YES;

}


@end
