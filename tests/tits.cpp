#include <gtest/gtest.h>

#include "solver.h"
#include "formatter_ex.h"
#include <cmath>

TEST(solver, zero){
	float x1=0, x2=0;
	solve(1, 2, 1, x1, x2);
	EXPECT_EQ(x1, -1.0);
	EXPECT_EQ(x2, -1.0);
}

float precize(float x1){
	return round(x1*10)/10;
}

TEST(solver, positive){
        float x1=0, x2=0;
        solve(1, 4, 1, x1, x2);
	EXPECT_EQ(precize(x1), precize(-3.7));
	EXPECT_EQ(precize(x2), precize(-0.3));
}

TEST(solver, negative){
        float x1=0, x2=0;
	try{
        	solve(4,1,2,x1,x2);
		FAIL()<<"expected error"<<std::endl;
	} catch(std::logic_error & err){
		EXPECT_EQ(err.what(), std::string("error: discriminant < 0"));
	} catch(...){
		FAIL() << "expected logic error" << std::endl;
	}
}

