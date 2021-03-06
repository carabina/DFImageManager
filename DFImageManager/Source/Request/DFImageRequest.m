// The MIT License (MIT)
//
// Copyright (c) 2015 Alexander Grebenyuk (github.com/kean).
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "DFImageRequest.h"
#import "DFImageRequestOptions.h"


@implementation DFImageRequest

- (instancetype)initWithResource:(id)resource targetSize:(CGSize)targetSize contentMode:(DFImageContentMode)contentMode options:(DFImageRequestOptions *)options {
    if (self = [super init]) {
        _resource = resource;
        _targetSize = targetSize;
        _contentMode = contentMode;
        _options = options ?: [DFImageRequestOptions new];
    }
    return self;
}

- (instancetype)initWithResource:(id)resource {
    return [self initWithResource:resource targetSize:DFImageMaximumSize contentMode:DFImageContentModeAspectFill options:nil];
}

- (id)copyWithZone:(NSZone *)zone {
    DFImageRequest *request = [DFImageRequest new];
    request.resource = self.resource;
    request.targetSize = self.targetSize;
    request.contentMode = self.contentMode;
    request.options = [self.options copy];
    return request;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %p> { resource = %@, targetSize = %@, contentMode = %i, options = %@ }", [self class], self, self.resource, NSStringFromCGSize(self.targetSize), (int)self.contentMode, self.options];
}

@end


@implementation DFImageRequest (UIKitAdditions)

+ (CGSize)targetSizeForView:(UIView *)view {
    CGSize size = view.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    return CGSizeMake(size.width * scale, size.height * scale);
}

@end
