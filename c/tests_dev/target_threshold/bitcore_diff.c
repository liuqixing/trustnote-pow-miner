#include <iostream>
#include <cmath> 

inline float fast_log(float val)
{
	int * const exp_ptr = reinterpret_cast <int *>(&val);
	int x = *exp_ptr;
	const int log_2 = ((x >> 23) & 255) - 128;
	x &= ~(255 << 23);
	x += 127 << 23;
	*exp_ptr = x;
	val = ((-1.0f/3) * val + 2) * val - 2.0f/3;
	return ((val + log_2) * 0.69314718f);
}

float bits(unsigned int bits)
{
	static double max_body	= fast_log( 0x00ffff );
	static double scaland	= fast_log( 256 );

	return exp( max_body - fast_log( bits & 0x00ffffff ) + scaland * (0x1d - ((bits & 0xff000000) >> 24)));
}

int main()
{
	std::cout << bits(0x1b0404cb) << std::endl;
	return 0;
}

