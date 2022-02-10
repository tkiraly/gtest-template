#include "is_on.h"

#include "gtest/gtest.h"

TEST(is_on, state_on) { EXPECT_EQ(true, is_on(true)); }
TEST(is_off, state_off) { EXPECT_EQ(false, is_on(false)); }

int main(int argc, char *argv[]) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
