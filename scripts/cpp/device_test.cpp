// main.cpp

#define NS_PRIVATE_IMPLEMENTATION
#define CA_PRIVATE_IMPLEMENTATION
#define MTL_PRIVATE_IMPLEMENTATION
#define MTK_PRIVATE_IMPLEMENTATION

#include <cstdio>
#include <iostream>

#include <Foundation/Foundation.hpp>
#include <Metal/Metal.hpp>

int main() {
    MTL::Device* device = MTL::CreateSystemDefaultDevice();
    // std::printf("%s", device->description()->cString(NS::UTF8StringEncoding));
    std::cout << "max buffer length: " << device->maxBufferLength() << std::endl;
    device->release();
}