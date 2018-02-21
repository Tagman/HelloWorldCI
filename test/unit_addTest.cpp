//
// Created by chris on 2/21/18.
//
#include "gtest/gtest.h"

//#include "Adder.h"

#include "../src/Adder.h"


TEST(simpleTests, simpleAdderTest) {

    Adder adder;

    ASSERT_EQ(adder.add(2,5), 7);

    ASSERT_NE(adder.add(1,0), 2);

}



