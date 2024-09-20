// main.cpp

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