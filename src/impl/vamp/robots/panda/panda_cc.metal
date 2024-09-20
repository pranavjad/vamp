#include <metal_stdlib>
#include "metal_shapes.hh"

using namespace metal;


bool panda_cc_internal(
    constant metal_shapes::Environment *environment,
    constant float *configurations,
    constant CollisionKernelArgs *args,
    uint id)
{
    float INPUT_0 = configurations[id * 7];
    float DIV_8 = INPUT_0 * 0.5;
    float SIN_9 = sin(DIV_8);
    float COS_15 = cos(DIV_8);
    float MUL_1575 = COS_15 * SIN_9;
    float MUL_1574 = SIN_9 * SIN_9;
    float MUL_1594 = MUL_1575 * 2.0;
    float MUL_1620 = MUL_1594 * 0.0265023;
    float MUL_1584 = MUL_1574 * 2.0;
    float SUB_1587 = 1.0 - MUL_1584;
    float MUL_1613 = SUB_1587 * 4.21e-05;
    float ADD_1636 = MUL_1613 + MUL_1620;
    float MUL_1623 = SUB_1587 * 0.0265023;
    float MUL_1615 = MUL_1594 * 4.21e-05;
    float SUB_1637 = MUL_1615 - MUL_1623;
    float MUL_1650 = MUL_1594 * 0.08;
    float MUL_1653 = SUB_1587 * 0.08;
    float NEGATE_1654 = -MUL_1653;
    float MUL_1674 = MUL_1594 * 0.03;
    float MUL_1677 = SUB_1587 * 0.03;
    float NEGATE_1678 = -MUL_1677;
    if (/*panda_link1*/ sphere_environment_in_collision(
        environment, ADD_1636, SUB_1637, 0.2598976, 0.144259))
    {
        if (sphere_environment_in_collision(environment, MUL_1650, NEGATE_1654, 0.333, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, MUL_1674, NEGATE_1678, 0.333, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, 0.0, 0.0, 0.213, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, 0.0, 0.0, 0.163, 0.06))
        {
            return false;
        }
    }  // (0, 21)
    float MUL_74 = COS_15 * 0.7071068;
    float MUL_72 = SIN_9 * 0.7071068;
    float INPUT_1 = configurations[id * 7 + 1];
    float DIV_117 = INPUT_1 * 0.5;
    float SIN_118 = sin(DIV_117);
    float COS_124 = cos(DIV_117);
    float MUL_143 = MUL_72 * COS_124;
    float MUL_128 = MUL_72 * SIN_118;
    float MUL_126 = MUL_74 * COS_124;
    float SUB_149 = MUL_126 - MUL_128;
    float ADD_130 = MUL_126 + MUL_128;
    float MUL_140 = MUL_74 * SIN_118;
    float SUB_138 = MUL_140 - MUL_143;
    float ADD_144 = MUL_140 + MUL_143;
    float MUL_1750 = SUB_149 * ADD_144;
    float MUL_1751 = SUB_149 * SUB_138;
    float MUL_1749 = ADD_144 * ADD_144;
    float MUL_1748 = SUB_138 * SUB_138;
    float ADD_1760 = MUL_1748 + MUL_1749;
    float MUL_1763 = ADD_1760 * 2.0;
    float SUB_1766 = 1.0 - MUL_1763;
    float MUL_1805 = SUB_1766 * 2.72e-05;
    float MUL_1757 = ADD_130 * ADD_144;
    float SUB_1790 = MUL_1751 - MUL_1757;
    float MUL_1792 = SUB_1790 * 2.0;
    float MUL_1826 = MUL_1792 * 0.0265382;
    float MUL_1755 = ADD_130 * SUB_138;
    float ADD_1775 = MUL_1755 + MUL_1750;
    float MUL_1778 = ADD_1775 * 2.0;
    float MUL_1816 = MUL_1778 * 0.074083;
    float SUB_1831 = MUL_1816 - MUL_1805;
    float ADD_1835 = SUB_1831 + MUL_1826;
    float SUB_1767 = MUL_1750 - MUL_1755;
    float MUL_1769 = SUB_1767 * 2.0;
    float MUL_1809 = MUL_1769 * 2.72e-05;
    float MUL_1753 = SUB_149 * ADD_130;
    float MUL_1759 = SUB_138 * ADD_144;
    float ADD_1793 = MUL_1759 + MUL_1753;
    float MUL_1795 = ADD_1793 * 2.0;
    float MUL_1828 = MUL_1795 * 0.0265382;
    float MUL_1752 = ADD_130 * ADD_130;
    float ADD_1780 = MUL_1749 + MUL_1752;
    float MUL_1783 = ADD_1780 * 2.0;
    float SUB_1786 = 1.0 - MUL_1783;
    float MUL_1819 = SUB_1786 * 0.074083;
    float ADD_1832 = MUL_1809 + MUL_1819;
    float SUB_1836 = MUL_1828 - ADD_1832;
    float SUB_1787 = MUL_1759 - MUL_1753;
    float ADD_1770 = MUL_1757 + MUL_1751;
    float ADD_1796 = MUL_1748 + MUL_1752;
    float MUL_1799 = ADD_1796 * 2.0;
    float SUB_1802 = 1.0 - MUL_1799;
    float MUL_1830 = SUB_1802 * 0.0265382;
    float MUL_1789 = SUB_1787 * 2.0;
    float MUL_1823 = MUL_1789 * 0.074083;
    float MUL_1773 = ADD_1770 * 2.0;
    float MUL_1813 = MUL_1773 * 2.72e-05;
    float SUB_1834 = MUL_1813 - MUL_1823;
    float ADD_1837 = SUB_1834 + MUL_1830;
    float ADD_1838 = 0.333 + ADD_1837;
    float MUL_1852 = MUL_1792 * 0.03;
    float MUL_1854 = MUL_1795 * 0.03;
    float MUL_1856 = SUB_1802 * 0.03;
    float ADD_1857 = 0.333 + MUL_1856;
    float MUL_1871 = MUL_1792 * 0.08;
    float MUL_1873 = MUL_1795 * 0.08;
    float MUL_1875 = SUB_1802 * 0.08;
    float ADD_1876 = 0.333 + MUL_1875;
    float MUL_1885 = MUL_1778 * 0.12;
    float MUL_1888 = SUB_1786 * 0.12;
    float NEGATE_1889 = -MUL_1888;
    float MUL_1892 = MUL_1789 * 0.12;
    float SUB_1900 = 0.333 - MUL_1892;
    float MUL_1909 = MUL_1778 * 0.17;
    float MUL_1912 = SUB_1786 * 0.17;
    float NEGATE_1913 = -MUL_1912;
    float MUL_1916 = MUL_1789 * 0.17;
    float SUB_1924 = 0.333 - MUL_1916;
    if (/*panda_link2*/ sphere_environment_in_collision(
        environment, ADD_1835, SUB_1836, ADD_1838, 0.145067))
    {
        if (sphere_environment_in_collision(environment, MUL_1852, MUL_1854, ADD_1857, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, MUL_1871, MUL_1873, ADD_1876, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, MUL_1885, NEGATE_1889, SUB_1900, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, MUL_1909, NEGATE_1913, SUB_1924, 0.06))
        {
            return false;
        }
    }  // (21, 99)
    float MUL_182 = SUB_149 * 0.7071068;
    float MUL_198 = ADD_144 * 0.7071068;
    float MUL_196 = SUB_138 * 0.7071068;
    float SUB_209 = MUL_198 - MUL_196;
    float ADD_199 = MUL_196 + MUL_198;
    float MUL_184 = ADD_130 * 0.7071068;
    float SUB_186 = MUL_182 - MUL_184;
    float ADD_215 = MUL_182 + MUL_184;
    float MUL_224 = ADD_144 * 0.316;
    float MUL_235 = SUB_149 * MUL_224;
    float MUL_228 = ADD_130 * 0.316;
    float MUL_236 = SUB_138 * MUL_228;
    float ADD_237 = MUL_235 + MUL_236;
    float MUL_240 = ADD_237 * 2.0;
    float INPUT_2 = configurations[id * 7 + 2];
    float DIV_262 = INPUT_2 * 0.5;
    float SIN_263 = sin(DIV_262);
    float COS_269 = cos(DIV_262);
    float MUL_286 = ADD_215 * COS_269;
    float MUL_281 = ADD_215 * SIN_263;
    float MUL_284 = SUB_209 * COS_269;
    float ADD_285 = MUL_281 + MUL_284;
    float MUL_1936 = ADD_285 * ADD_285;
    float MUL_289 = SUB_209 * SIN_263;
    float SUB_290 = MUL_286 - MUL_289;
    float MUL_1937 = SUB_290 * ADD_285;
    float MUL_271 = SUB_186 * COS_269;
    float MUL_276 = SUB_186 * SIN_263;
    float MUL_278 = ADD_199 * COS_269;
    float SUB_279 = MUL_278 - MUL_276;
    float MUL_1938 = SUB_290 * SUB_279;
    float MUL_1935 = SUB_279 * SUB_279;
    float ADD_1944 = MUL_1935 + MUL_1936;
    float MUL_1947 = ADD_1944 * 2.0;
    float SUB_1950 = 1.0 - MUL_1947;
    float MUL_1984 = SUB_1950 * 0.0404726;
    float MUL_272 = ADD_199 * SIN_263;
    float ADD_273 = MUL_271 + MUL_272;
    float MUL_1942 = ADD_273 * ADD_285;
    float ADD_1970 = MUL_1942 + MUL_1938;
    float MUL_1972 = ADD_1970 * 2.0;
    float MUL_1997 = MUL_1972 * 0.0439448;
    float MUL_1941 = ADD_273 * SUB_279;
    float SUB_1957 = MUL_1941 - MUL_1937;
    float MUL_1959 = SUB_1957 * 2.0;
    float MUL_1990 = MUL_1959 * 0.0229569;
    float ADD_2007 = MUL_1984 + MUL_1990;
    float SUB_2010 = ADD_2007 - MUL_1997;
    float ADD_2013 = MUL_240 + SUB_2010;
    float ADD_1951 = MUL_1941 + MUL_1937;
    float MUL_1953 = ADD_1951 * 2.0;
    float MUL_1986 = MUL_1953 * 0.0404726;
    float MUL_1940 = SUB_290 * ADD_273;
    float MUL_1943 = SUB_279 * ADD_285;
    float SUB_1973 = MUL_1943 - MUL_1940;
    float MUL_1975 = SUB_1973 * 2.0;
    float MUL_2001 = MUL_1975 * 0.0439448;
    float MUL_1939 = ADD_273 * ADD_273;
    float ADD_1960 = MUL_1936 + MUL_1939;
    float MUL_1963 = ADD_1960 * 2.0;
    float SUB_1966 = 1.0 - MUL_1963;
    float MUL_1992 = SUB_1966 * 0.0229569;
    float ADD_2008 = MUL_1986 + MUL_1992;
    float SUB_2011 = ADD_2008 - MUL_2001;
    float MUL_246 = ADD_144 * MUL_224;
    float MUL_244 = ADD_130 * MUL_228;
    float ADD_247 = MUL_244 + MUL_246;
    float MUL_249 = ADD_247 * 2.0;
    float SUB_252 = MUL_249 - 0.316;
    float ADD_2014 = SUB_252 + SUB_2011;
    float SUB_1954 = MUL_1942 - MUL_1938;
    float ADD_1967 = MUL_1943 + MUL_1940;
    float ADD_1976 = MUL_1935 + MUL_1939;
    float MUL_1979 = ADD_1976 * 2.0;
    float SUB_1982 = 1.0 - MUL_1979;
    float MUL_2005 = SUB_1982 * 0.0439448;
    float MUL_1969 = ADD_1967 * 2.0;
    float MUL_1994 = MUL_1969 * 0.0229569;
    float MUL_1956 = SUB_1954 * 2.0;
    float MUL_1988 = MUL_1956 * 0.0404726;
    float ADD_2009 = MUL_1988 + MUL_1994;
    float SUB_2012 = ADD_2009 - MUL_2005;
    float MUL_253 = SUB_149 * MUL_228;
    float MUL_255 = SUB_138 * MUL_224;
    float SUB_256 = MUL_253 - MUL_255;
    float MUL_258 = SUB_256 * 2.0;
    float ADD_260 = 0.333 + MUL_258;
    float ADD_2015 = ADD_260 + SUB_2012;
    float MUL_2030 = MUL_1972 * 0.1;
    float SUB_2040 = MUL_240 - MUL_2030;
    float MUL_2034 = MUL_1975 * 0.1;
    float SUB_2041 = SUB_252 - MUL_2034;
    float MUL_2038 = SUB_1982 * 0.1;
    float SUB_2042 = ADD_260 - MUL_2038;
    float MUL_2057 = MUL_1972 * 0.06;
    float SUB_2067 = MUL_240 - MUL_2057;
    float MUL_2061 = MUL_1975 * 0.06;
    float SUB_2068 = SUB_252 - MUL_2061;
    float MUL_2065 = SUB_1982 * 0.06;
    float SUB_2069 = ADD_260 - MUL_2065;
    float MUL_2077 = MUL_1959 * 0.06;
    float MUL_2071 = SUB_1950 * 0.08;
    float ADD_2088 = MUL_2071 + MUL_2077;
    float ADD_2091 = MUL_240 + ADD_2088;
    float MUL_2079 = SUB_1966 * 0.06;
    float MUL_2073 = MUL_1953 * 0.08;
    float ADD_2089 = MUL_2073 + MUL_2079;
    float ADD_2092 = SUB_252 + ADD_2089;
    float MUL_2081 = MUL_1969 * 0.06;
    float MUL_2075 = MUL_1956 * 0.08;
    float ADD_2090 = MUL_2075 + MUL_2081;
    float ADD_2093 = ADD_260 + ADD_2090;
    float MUL_2101 = MUL_1959 * 0.02;
    float ADD_2112 = MUL_2071 + MUL_2101;
    float ADD_2115 = MUL_240 + ADD_2112;
    float MUL_2103 = SUB_1966 * 0.02;
    float ADD_2113 = MUL_2073 + MUL_2103;
    float ADD_2116 = SUB_252 + ADD_2113;
    float MUL_2105 = MUL_1969 * 0.02;
    float ADD_2114 = MUL_2075 + MUL_2105;
    float ADD_2117 = ADD_260 + ADD_2114;
    if (/*panda_link3*/ sphere_environment_in_collision(
        environment, ADD_2013, ADD_2014, ADD_2015, 0.127656))
    {
        if (sphere_environment_in_collision(environment, SUB_2040, SUB_2041, SUB_2042, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, SUB_2067, SUB_2068, SUB_2069, 0.05))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2091, ADD_2092, ADD_2093, 0.055))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2115, ADD_2116, ADD_2117, 0.055))
        {
            return false;
        }
    }  // (99, 220)
    float MUL_323 = SUB_290 * 0.7071068;
    float MUL_338 = ADD_285 * 0.7071068;
    float MUL_336 = SUB_279 * 0.7071068;
    float SUB_349 = MUL_338 - MUL_336;
    float ADD_339 = MUL_336 + MUL_338;
    float MUL_325 = ADD_273 * 0.7071068;
    float SUB_354 = MUL_323 - MUL_325;
    float ADD_326 = MUL_323 + MUL_325;
    float MUL_371 = ADD_285 * 0.0825;
    float MUL_376 = ADD_285 * MUL_371;
    float MUL_366 = SUB_279 * 0.0825;
    float MUL_374 = SUB_279 * MUL_366;
    float ADD_378 = MUL_374 + MUL_376;
    float MUL_381 = ADD_378 * 2.0;
    float SUB_384 = 0.0825 - MUL_381;
    float ADD_403 = MUL_240 + SUB_384;
    float INPUT_3 = configurations[id * 7 + 3];
    float DIV_407 = INPUT_3 * 0.5;
    float SIN_408 = sin(DIV_407);
    float COS_414 = cos(DIV_407);
    float MUL_431 = SUB_354 * COS_414;
    float MUL_426 = SUB_354 * SIN_408;
    float MUL_429 = SUB_349 * COS_414;
    float ADD_430 = MUL_426 + MUL_429;
    float MUL_2129 = ADD_430 * ADD_430;
    float MUL_434 = SUB_349 * SIN_408;
    float SUB_435 = MUL_431 - MUL_434;
    float MUL_2130 = SUB_435 * ADD_430;
    float MUL_416 = ADD_326 * COS_414;
    float MUL_421 = ADD_326 * SIN_408;
    float MUL_423 = ADD_339 * COS_414;
    float SUB_424 = MUL_423 - MUL_421;
    float MUL_2131 = SUB_435 * SUB_424;
    float MUL_2128 = SUB_424 * SUB_424;
    float ADD_2137 = MUL_2128 + MUL_2129;
    float MUL_2140 = ADD_2137 * 2.0;
    float SUB_2143 = 1.0 - MUL_2140;
    float MUL_2178 = SUB_2143 * 0.0422068;
    float MUL_417 = ADD_339 * SIN_408;
    float ADD_418 = MUL_416 + MUL_417;
    float MUL_2135 = ADD_418 * ADD_430;
    float ADD_2163 = MUL_2135 + MUL_2131;
    float MUL_2165 = ADD_2163 * 2.0;
    float MUL_2195 = MUL_2165 * 0.0226917;
    float MUL_2134 = ADD_418 * SUB_424;
    float SUB_2150 = MUL_2134 - MUL_2130;
    float MUL_2152 = SUB_2150 * 2.0;
    float MUL_2189 = MUL_2152 * 0.0449876;
    float SUB_2200 = MUL_2189 - MUL_2178;
    float ADD_2203 = SUB_2200 + MUL_2195;
    float ADD_2206 = ADD_403 + ADD_2203;
    float ADD_2144 = MUL_2134 + MUL_2130;
    float MUL_2146 = ADD_2144 * 2.0;
    float MUL_2182 = MUL_2146 * 0.0422068;
    float MUL_2133 = SUB_435 * ADD_418;
    float MUL_2136 = SUB_424 * ADD_430;
    float SUB_2166 = MUL_2136 - MUL_2133;
    float MUL_2168 = SUB_2166 * 2.0;
    float MUL_2197 = MUL_2168 * 0.0226917;
    float MUL_2132 = ADD_418 * ADD_418;
    float ADD_2153 = MUL_2129 + MUL_2132;
    float MUL_2156 = ADD_2153 * 2.0;
    float SUB_2159 = 1.0 - MUL_2156;
    float MUL_2191 = SUB_2159 * 0.0449876;
    float SUB_2201 = MUL_2191 - MUL_2182;
    float ADD_2204 = SUB_2201 + MUL_2197;
    float MUL_386 = SUB_290 * MUL_371;
    float MUL_387 = ADD_273 * MUL_366;
    float ADD_389 = MUL_386 + MUL_387;
    float MUL_392 = ADD_389 * 2.0;
    float ADD_404 = SUB_252 + MUL_392;
    float ADD_2207 = ADD_404 + ADD_2204;
    float SUB_2147 = MUL_2135 - MUL_2131;
    float ADD_2160 = MUL_2136 + MUL_2133;
    float ADD_2169 = MUL_2128 + MUL_2132;
    float MUL_2172 = ADD_2169 * 2.0;
    float SUB_2175 = 1.0 - MUL_2172;
    float MUL_2199 = SUB_2175 * 0.0226917;
    float MUL_2162 = ADD_2160 * 2.0;
    float MUL_2193 = MUL_2162 * 0.0449876;
    float MUL_2149 = SUB_2147 * 2.0;
    float MUL_2186 = MUL_2149 * 0.0422068;
    float SUB_2202 = MUL_2193 - MUL_2186;
    float ADD_2205 = SUB_2202 + MUL_2199;
    float MUL_394 = SUB_290 * MUL_366;
    float MUL_396 = ADD_273 * MUL_371;
    float SUB_398 = MUL_396 - MUL_394;
    float MUL_401 = SUB_398 * 2.0;
    float ADD_405 = ADD_260 + MUL_401;
    float ADD_2208 = ADD_405 + ADD_2205;
    float MUL_2211 = SUB_2143 * 0.08;
    float MUL_2222 = MUL_2152 * 0.095;
    float SUB_2233 = MUL_2222 - MUL_2211;
    float ADD_2236 = ADD_403 + SUB_2233;
    float MUL_2224 = SUB_2159 * 0.095;
    float MUL_2215 = MUL_2146 * 0.08;
    float SUB_2234 = MUL_2224 - MUL_2215;
    float ADD_2237 = ADD_404 + SUB_2234;
    float MUL_2226 = MUL_2162 * 0.095;
    float MUL_2219 = MUL_2149 * 0.08;
    float SUB_2235 = MUL_2226 - MUL_2219;
    float ADD_2238 = ADD_405 + SUB_2235;
    float MUL_2252 = MUL_2165 * 0.02;
    float ADD_2257 = ADD_403 + MUL_2252;
    float MUL_2254 = MUL_2168 * 0.02;
    float ADD_2258 = ADD_404 + MUL_2254;
    float MUL_2256 = SUB_2175 * 0.02;
    float ADD_2259 = ADD_405 + MUL_2256;
    float MUL_2273 = MUL_2165 * 0.06;
    float ADD_2278 = ADD_403 + MUL_2273;
    float MUL_2275 = MUL_2168 * 0.06;
    float ADD_2279 = ADD_404 + MUL_2275;
    float MUL_2277 = SUB_2175 * 0.06;
    float ADD_2280 = ADD_405 + MUL_2277;
    float MUL_2294 = MUL_2152 * 0.06;
    float SUB_2305 = MUL_2294 - MUL_2211;
    float ADD_2308 = ADD_403 + SUB_2305;
    float MUL_2296 = SUB_2159 * 0.06;
    float SUB_2306 = MUL_2296 - MUL_2215;
    float ADD_2309 = ADD_404 + SUB_2306;
    float MUL_2298 = MUL_2162 * 0.06;
    float SUB_2307 = MUL_2298 - MUL_2219;
    float ADD_2310 = ADD_405 + SUB_2307;
    if (/*panda_link4*/ sphere_environment_in_collision(
        environment, ADD_2206, ADD_2207, ADD_2208, 0.12849))
    {
        if (sphere_environment_in_collision(environment, ADD_2236, ADD_2237, ADD_2238, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2257, ADD_2258, ADD_2259, 0.055))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2278, ADD_2279, ADD_2280, 0.055))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2308, ADD_2309, ADD_2310, 0.055))
        {
            return false;
        }
    }  // (220, 343)
    float MUL_469 = SUB_435 * 0.7071068;
    float MUL_486 = ADD_430 * 0.7071068;
    float MUL_527 = ADD_430 * 0.0825;
    float MUL_533 = ADD_430 * MUL_527;
    float MUL_483 = SUB_424 * 0.7071068;
    float SUB_488 = MUL_483 - MUL_486;
    float ADD_499 = MUL_483 + MUL_486;
    float MUL_520 = SUB_424 * 0.0825;
    float MUL_472 = ADD_418 * 0.7071068;
    float SUB_473 = MUL_472 - MUL_469;
    float ADD_506 = MUL_469 + MUL_472;
    float MUL_514 = ADD_430 * 0.384;
    float MUL_529 = SUB_435 * MUL_514;
    float MUL_517 = ADD_418 * 0.384;
    float ADD_522 = MUL_517 + MUL_520;
    float MUL_531 = SUB_424 * ADD_522;
    float SUB_532 = MUL_531 - MUL_529;
    float ADD_534 = SUB_532 + MUL_533;
    float MUL_536 = ADD_534 * 2.0;
    float SUB_539 = MUL_536 - 0.0825;
    float ADD_564 = ADD_403 + SUB_539;
    float INPUT_4 = configurations[id * 7 + 4];
    float DIV_568 = INPUT_4 * 0.5;
    float SIN_569 = sin(DIV_568);
    float COS_575 = cos(DIV_568);
    float MUL_592 = ADD_506 * COS_575;
    float MUL_587 = ADD_506 * SIN_569;
    float MUL_590 = ADD_499 * COS_575;
    float ADD_591 = MUL_587 + MUL_590;
    float MUL_2322 = ADD_591 * ADD_591;
    float MUL_595 = ADD_499 * SIN_569;
    float SUB_596 = MUL_592 - MUL_595;
    float MUL_2323 = SUB_596 * ADD_591;
    float MUL_577 = SUB_473 * COS_575;
    float MUL_582 = SUB_473 * SIN_569;
    float MUL_584 = SUB_488 * COS_575;
    float SUB_585 = MUL_584 - MUL_582;
    float MUL_2324 = SUB_596 * SUB_585;
    float MUL_2321 = SUB_585 * SUB_585;
    float ADD_2330 = MUL_2321 + MUL_2322;
    float MUL_2333 = ADD_2330 * 2.0;
    float SUB_2336 = 1.0 - MUL_2333;
    float MUL_2370 = SUB_2336 * 3.14e-05;
    float MUL_578 = SUB_488 * SIN_569;
    float ADD_579 = MUL_577 + MUL_578;
    float MUL_2328 = ADD_579 * ADD_591;
    float ADD_2356 = MUL_2328 + MUL_2324;
    float MUL_2358 = ADD_2356 * 2.0;
    float MUL_2383 = MUL_2358 * 0.1065559;
    float MUL_2327 = ADD_579 * SUB_585;
    float SUB_2343 = MUL_2327 - MUL_2323;
    float MUL_2345 = SUB_2343 * 2.0;
    float MUL_2376 = MUL_2345 * 0.027819;
    float ADD_2393 = MUL_2370 + MUL_2376;
    float SUB_2396 = ADD_2393 - MUL_2383;
    float ADD_2399 = ADD_564 + SUB_2396;
    float ADD_2337 = MUL_2327 + MUL_2323;
    float MUL_2339 = ADD_2337 * 2.0;
    float MUL_2372 = MUL_2339 * 3.14e-05;
    float MUL_2326 = SUB_596 * ADD_579;
    float MUL_2329 = SUB_585 * ADD_591;
    float SUB_2359 = MUL_2329 - MUL_2326;
    float MUL_2361 = SUB_2359 * 2.0;
    float MUL_2387 = MUL_2361 * 0.1065559;
    float MUL_2325 = ADD_579 * ADD_579;
    float ADD_2346 = MUL_2322 + MUL_2325;
    float MUL_2349 = ADD_2346 * 2.0;
    float SUB_2352 = 1.0 - MUL_2349;
    float MUL_2378 = SUB_2352 * 0.027819;
    float ADD_2394 = MUL_2372 + MUL_2378;
    float SUB_2397 = ADD_2394 - MUL_2387;
    float MUL_541 = SUB_435 * MUL_527;
    float MUL_546 = ADD_430 * MUL_514;
    float MUL_543 = ADD_418 * ADD_522;
    float ADD_544 = MUL_541 + MUL_543;
    float ADD_548 = ADD_544 + MUL_546;
    float MUL_551 = ADD_548 * 2.0;
    float SUB_554 = 0.384 - MUL_551;
    float ADD_565 = ADD_404 + SUB_554;
    float ADD_2400 = ADD_565 + SUB_2397;
    float SUB_2340 = MUL_2328 - MUL_2324;
    float ADD_2353 = MUL_2329 + MUL_2326;
    float ADD_2362 = MUL_2321 + MUL_2325;
    float MUL_2365 = ADD_2362 * 2.0;
    float SUB_2368 = 1.0 - MUL_2365;
    float MUL_2391 = SUB_2368 * 0.1065559;
    float MUL_2355 = ADD_2353 * 2.0;
    float MUL_2380 = MUL_2355 * 0.027819;
    float MUL_2342 = SUB_2340 * 2.0;
    float MUL_2374 = MUL_2342 * 3.14e-05;
    float ADD_2395 = MUL_2374 + MUL_2380;
    float SUB_2398 = ADD_2395 - MUL_2391;
    float MUL_555 = SUB_435 * ADD_522;
    float MUL_558 = SUB_424 * MUL_514;
    float MUL_556 = ADD_418 * MUL_527;
    float SUB_557 = MUL_555 - MUL_556;
    float ADD_560 = SUB_557 + MUL_558;
    float MUL_562 = ADD_560 * 2.0;
    float ADD_566 = ADD_405 + MUL_562;
    float ADD_2401 = ADD_566 + SUB_2398;
    float MUL_2409 = MUL_2345 * 0.055;
    float ADD_2420 = ADD_564 + MUL_2409;
    float MUL_2411 = SUB_2352 * 0.055;
    float ADD_2421 = ADD_565 + MUL_2411;
    float MUL_2413 = MUL_2355 * 0.055;
    float ADD_2422 = ADD_566 + MUL_2413;
    float MUL_2430 = MUL_2345 * 0.075;
    float ADD_2441 = ADD_564 + MUL_2430;
    float MUL_2432 = SUB_2352 * 0.075;
    float ADD_2442 = ADD_565 + MUL_2432;
    float MUL_2434 = MUL_2355 * 0.075;
    float ADD_2443 = ADD_566 + MUL_2434;
    float MUL_2458 = MUL_2358 * 0.22;
    float SUB_2468 = ADD_564 - MUL_2458;
    float MUL_2462 = MUL_2361 * 0.22;
    float SUB_2469 = ADD_565 - MUL_2462;
    float MUL_2466 = SUB_2368 * 0.22;
    float SUB_2470 = ADD_566 - MUL_2466;
    float MUL_2485 = MUL_2358 * 0.18;
    float MUL_2478 = MUL_2345 * 0.05;
    float SUB_2495 = MUL_2478 - MUL_2485;
    float ADD_2498 = ADD_564 + SUB_2495;
    float MUL_2489 = MUL_2361 * 0.18;
    float MUL_2480 = SUB_2352 * 0.05;
    float SUB_2496 = MUL_2480 - MUL_2489;
    float ADD_2499 = ADD_565 + SUB_2496;
    float MUL_2493 = SUB_2368 * 0.18;
    float MUL_2482 = MUL_2355 * 0.05;
    float SUB_2497 = MUL_2482 - MUL_2493;
    float ADD_2500 = ADD_566 + SUB_2497;
    float MUL_2508 = MUL_2345 * 0.08;
    float MUL_2515 = MUL_2358 * 0.14;
    float MUL_2502 = SUB_2336 * 0.01;
    float ADD_2525 = MUL_2502 + MUL_2508;
    float SUB_2528 = ADD_2525 - MUL_2515;
    float ADD_2531 = ADD_564 + SUB_2528;
    float MUL_2519 = MUL_2361 * 0.14;
    float MUL_2510 = SUB_2352 * 0.08;
    float MUL_2504 = MUL_2339 * 0.01;
    float ADD_2526 = MUL_2504 + MUL_2510;
    float SUB_2529 = ADD_2526 - MUL_2519;
    float ADD_2532 = ADD_565 + SUB_2529;
    float MUL_2523 = SUB_2368 * 0.14;
    float MUL_2512 = MUL_2355 * 0.08;
    float MUL_2506 = MUL_2342 * 0.01;
    float ADD_2527 = MUL_2506 + MUL_2512;
    float SUB_2530 = ADD_2527 - MUL_2523;
    float ADD_2533 = ADD_566 + SUB_2530;
    float MUL_2548 = MUL_2358 * 0.11;
    float MUL_2541 = MUL_2345 * 0.085;
    float ADD_2558 = MUL_2502 + MUL_2541;
    float SUB_2561 = ADD_2558 - MUL_2548;
    float ADD_2564 = ADD_564 + SUB_2561;
    float MUL_2552 = MUL_2361 * 0.11;
    float MUL_2543 = SUB_2352 * 0.085;
    float ADD_2559 = MUL_2504 + MUL_2543;
    float SUB_2562 = ADD_2559 - MUL_2552;
    float ADD_2565 = ADD_565 + SUB_2562;
    float MUL_2556 = SUB_2368 * 0.11;
    float MUL_2545 = MUL_2355 * 0.085;
    float ADD_2560 = MUL_2506 + MUL_2545;
    float SUB_2563 = ADD_2560 - MUL_2556;
    float ADD_2566 = ADD_566 + SUB_2563;
    float MUL_2581 = MUL_2358 * 0.08;
    float MUL_2574 = MUL_2345 * 0.09;
    float ADD_2591 = MUL_2502 + MUL_2574;
    float SUB_2594 = ADD_2591 - MUL_2581;
    float ADD_2597 = ADD_564 + SUB_2594;
    float MUL_2585 = MUL_2361 * 0.08;
    float MUL_2576 = SUB_2352 * 0.09;
    float ADD_2592 = MUL_2504 + MUL_2576;
    float SUB_2595 = ADD_2592 - MUL_2585;
    float ADD_2598 = ADD_565 + SUB_2595;
    float MUL_2589 = SUB_2368 * 0.08;
    float MUL_2578 = MUL_2355 * 0.09;
    float ADD_2593 = MUL_2506 + MUL_2578;
    float SUB_2596 = ADD_2593 - MUL_2589;
    float ADD_2599 = ADD_566 + SUB_2596;
    float MUL_2614 = MUL_2358 * 0.05;
    float MUL_2607 = MUL_2345 * 0.095;
    float ADD_2624 = MUL_2502 + MUL_2607;
    float SUB_2627 = ADD_2624 - MUL_2614;
    float ADD_2630 = ADD_564 + SUB_2627;
    float MUL_2618 = MUL_2361 * 0.05;
    float MUL_2609 = SUB_2352 * 0.095;
    float ADD_2625 = MUL_2504 + MUL_2609;
    float SUB_2628 = ADD_2625 - MUL_2618;
    float ADD_2631 = ADD_565 + SUB_2628;
    float MUL_2622 = SUB_2368 * 0.05;
    float MUL_2611 = MUL_2355 * 0.095;
    float ADD_2626 = MUL_2506 + MUL_2611;
    float SUB_2629 = ADD_2626 - MUL_2622;
    float ADD_2632 = ADD_566 + SUB_2629;
    float SUB_2663 = MUL_2508 - MUL_2502;
    float SUB_2666 = SUB_2663 - MUL_2515;
    float ADD_2669 = ADD_564 + SUB_2666;
    float SUB_2664 = MUL_2510 - MUL_2504;
    float SUB_2667 = SUB_2664 - MUL_2519;
    float ADD_2670 = ADD_565 + SUB_2667;
    float SUB_2665 = MUL_2512 - MUL_2506;
    float SUB_2668 = SUB_2665 - MUL_2523;
    float ADD_2671 = ADD_566 + SUB_2668;
    float SUB_2702 = MUL_2541 - MUL_2502;
    float SUB_2705 = SUB_2702 - MUL_2548;
    float ADD_2708 = ADD_564 + SUB_2705;
    float SUB_2703 = MUL_2543 - MUL_2504;
    float SUB_2706 = SUB_2703 - MUL_2552;
    float ADD_2709 = ADD_565 + SUB_2706;
    float SUB_2704 = MUL_2545 - MUL_2506;
    float SUB_2707 = SUB_2704 - MUL_2556;
    float ADD_2710 = ADD_566 + SUB_2707;
    float SUB_2741 = MUL_2574 - MUL_2502;
    float SUB_2744 = SUB_2741 - MUL_2581;
    float ADD_2747 = ADD_564 + SUB_2744;
    float SUB_2742 = MUL_2576 - MUL_2504;
    float SUB_2745 = SUB_2742 - MUL_2585;
    float ADD_2748 = ADD_565 + SUB_2745;
    float SUB_2743 = MUL_2578 - MUL_2506;
    float SUB_2746 = SUB_2743 - MUL_2589;
    float ADD_2749 = ADD_566 + SUB_2746;
    float SUB_2780 = MUL_2607 - MUL_2502;
    float SUB_2783 = SUB_2780 - MUL_2614;
    float ADD_2786 = ADD_564 + SUB_2783;
    float SUB_2781 = MUL_2609 - MUL_2504;
    float SUB_2784 = SUB_2781 - MUL_2618;
    float ADD_2787 = ADD_565 + SUB_2784;
    float SUB_2782 = MUL_2611 - MUL_2506;
    float SUB_2785 = SUB_2782 - MUL_2622;
    float ADD_2788 = ADD_566 + SUB_2785;
    if (/*panda_link0 vs. panda_link5*/ sphere_sphere_self_collision(
        -0.043343, 1.4e-06, 0.0629063, 0.130366, ADD_2399, ADD_2400, ADD_2401, 0.173531))
    {
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2420, ADD_2421, ADD_2422, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2441, ADD_2442, ADD_2443, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, SUB_2468, SUB_2469, SUB_2470, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2498, ADD_2499, ADD_2500, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2531, ADD_2532, ADD_2533, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2564, ADD_2565, ADD_2566, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2597, ADD_2598, ADD_2599, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2630, ADD_2631, ADD_2632, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2669, ADD_2670, ADD_2671, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2708, ADD_2709, ADD_2710, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2747, ADD_2748, ADD_2749, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2786, ADD_2787, ADD_2788, 0.025))
        {
            return false;
        }
    }  // (343, 572)
    if (/*panda_link1 vs. panda_link5*/ sphere_sphere_self_collision(
        ADD_1636, SUB_1637, 0.2598976, 0.144259, ADD_2399, ADD_2400, ADD_2401, 0.173531))
    {
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2420, ADD_2421, ADD_2422, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2441, ADD_2442, ADD_2443, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, SUB_2468, SUB_2469, SUB_2470, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2498, ADD_2499, ADD_2500, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2531, ADD_2532, ADD_2533, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2564, ADD_2565, ADD_2566, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2597, ADD_2598, ADD_2599, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2630, ADD_2631, ADD_2632, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2669, ADD_2670, ADD_2671, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2708, ADD_2709, ADD_2710, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2747, ADD_2748, ADD_2749, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2786, ADD_2787, ADD_2788, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2420, ADD_2421, ADD_2422, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2441, ADD_2442, ADD_2443, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, SUB_2468, SUB_2469, SUB_2470, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2498, ADD_2499, ADD_2500, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2531, ADD_2532, ADD_2533, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2564, ADD_2565, ADD_2566, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2597, ADD_2598, ADD_2599, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2630, ADD_2631, ADD_2632, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2669, ADD_2670, ADD_2671, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2708, ADD_2709, ADD_2710, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2747, ADD_2748, ADD_2749, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2786, ADD_2787, ADD_2788, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2420, ADD_2421, ADD_2422, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2441, ADD_2442, ADD_2443, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, SUB_2468, SUB_2469, SUB_2470, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2498, ADD_2499, ADD_2500, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2531, ADD_2532, ADD_2533, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2564, ADD_2565, ADD_2566, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2597, ADD_2598, ADD_2599, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2630, ADD_2631, ADD_2632, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2669, ADD_2670, ADD_2671, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2708, ADD_2709, ADD_2710, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2747, ADD_2748, ADD_2749, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2786, ADD_2787, ADD_2788, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2420, ADD_2421, ADD_2422, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2441, ADD_2442, ADD_2443, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, SUB_2468, SUB_2469, SUB_2470, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2498, ADD_2499, ADD_2500, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2531, ADD_2532, ADD_2533, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2564, ADD_2565, ADD_2566, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2597, ADD_2598, ADD_2599, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2630, ADD_2631, ADD_2632, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2669, ADD_2670, ADD_2671, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2708, ADD_2709, ADD_2710, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2747, ADD_2748, ADD_2749, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2786, ADD_2787, ADD_2788, 0.025))
        {
            return false;
        }
    }  // (572, 572)
    if (/*panda_link2 vs. panda_link5*/ sphere_sphere_self_collision(
        ADD_1835, SUB_1836, ADD_1838, 0.145067, ADD_2399, ADD_2400, ADD_2401, 0.173531))
    {
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2420, ADD_2421, ADD_2422, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2441, ADD_2442, ADD_2443, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, SUB_2468, SUB_2469, SUB_2470, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2498, ADD_2499, ADD_2500, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2531, ADD_2532, ADD_2533, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2564, ADD_2565, ADD_2566, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2597, ADD_2598, ADD_2599, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2630, ADD_2631, ADD_2632, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2669, ADD_2670, ADD_2671, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2708, ADD_2709, ADD_2710, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2747, ADD_2748, ADD_2749, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_2786, ADD_2787, ADD_2788, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2420, ADD_2421, ADD_2422, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2441, ADD_2442, ADD_2443, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, SUB_2468, SUB_2469, SUB_2470, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2498, ADD_2499, ADD_2500, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2531, ADD_2532, ADD_2533, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2564, ADD_2565, ADD_2566, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2597, ADD_2598, ADD_2599, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2630, ADD_2631, ADD_2632, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2669, ADD_2670, ADD_2671, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2708, ADD_2709, ADD_2710, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2747, ADD_2748, ADD_2749, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_2786, ADD_2787, ADD_2788, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2420, ADD_2421, ADD_2422, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2441, ADD_2442, ADD_2443, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, SUB_2468, SUB_2469, SUB_2470, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2498, ADD_2499, ADD_2500, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2531, ADD_2532, ADD_2533, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2564, ADD_2565, ADD_2566, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2597, ADD_2598, ADD_2599, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2630, ADD_2631, ADD_2632, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2669, ADD_2670, ADD_2671, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2708, ADD_2709, ADD_2710, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2747, ADD_2748, ADD_2749, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_2786, ADD_2787, ADD_2788, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2420, ADD_2421, ADD_2422, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2441, ADD_2442, ADD_2443, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, SUB_2468, SUB_2469, SUB_2470, 0.06))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2498, ADD_2499, ADD_2500, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2531, ADD_2532, ADD_2533, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2564, ADD_2565, ADD_2566, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2597, ADD_2598, ADD_2599, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2630, ADD_2631, ADD_2632, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2669, ADD_2670, ADD_2671, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2708, ADD_2709, ADD_2710, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2747, ADD_2748, ADD_2749, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_2786, ADD_2787, ADD_2788, 0.025))
        {
            return false;
        }
    }  // (572, 572)
    if (/*panda_link5*/ sphere_environment_in_collision(
        environment, ADD_2399, ADD_2400, ADD_2401, 0.173531))
    {
        if (sphere_environment_in_collision(environment, ADD_2420, ADD_2421, ADD_2422, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2441, ADD_2442, ADD_2443, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, SUB_2468, SUB_2469, SUB_2470, 0.06))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2498, ADD_2499, ADD_2500, 0.05))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2531, ADD_2532, ADD_2533, 0.025))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2564, ADD_2565, ADD_2566, 0.025))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2597, ADD_2598, ADD_2599, 0.025))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2630, ADD_2631, ADD_2632, 0.025))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2669, ADD_2670, ADD_2671, 0.025))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2708, ADD_2709, ADD_2710, 0.025))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2747, ADD_2748, ADD_2749, 0.025))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2786, ADD_2787, ADD_2788, 0.025))
        {
            return false;
        }
    }  // (572, 572)
    float MUL_629 = SUB_596 * 0.7071068;
    float MUL_644 = ADD_591 * 0.7071068;
    float MUL_642 = SUB_585 * 0.7071068;
    float SUB_655 = MUL_644 - MUL_642;
    float ADD_645 = MUL_642 + MUL_644;
    float MUL_631 = ADD_579 * 0.7071068;
    float SUB_660 = MUL_629 - MUL_631;
    float ADD_632 = MUL_629 + MUL_631;
    float INPUT_5 = configurations[id * 7 + 5];
    float DIV_697 = INPUT_5 * 0.5;
    float SIN_698 = sin(DIV_697);
    float COS_704 = cos(DIV_697);
    float MUL_716 = SUB_660 * SIN_698;
    float MUL_721 = SUB_660 * COS_704;
    float MUL_724 = SUB_655 * SIN_698;
    float SUB_725 = MUL_721 - MUL_724;
    float MUL_719 = SUB_655 * COS_704;
    float ADD_720 = MUL_716 + MUL_719;
    float MUL_2817 = SUB_725 * ADD_720;
    float MUL_2816 = ADD_720 * ADD_720;
    float MUL_711 = ADD_632 * SIN_698;
    float MUL_706 = ADD_632 * COS_704;
    float MUL_707 = ADD_645 * SIN_698;
    float ADD_708 = MUL_706 + MUL_707;
    float MUL_2822 = ADD_708 * ADD_720;
    float MUL_713 = ADD_645 * COS_704;
    float SUB_714 = MUL_713 - MUL_711;
    float MUL_2818 = SUB_725 * SUB_714;
    float ADD_2850 = MUL_2822 + MUL_2818;
    float MUL_2852 = ADD_2850 * 2.0;
    float MUL_2876 = MUL_2852 * 0.0108239;
    float MUL_2815 = SUB_714 * SUB_714;
    float ADD_2824 = MUL_2815 + MUL_2816;
    float MUL_2827 = ADD_2824 * 2.0;
    float SUB_2830 = 1.0 - MUL_2827;
    float MUL_2864 = SUB_2830 * 0.0485274;
    float MUL_2821 = ADD_708 * SUB_714;
    float SUB_2837 = MUL_2821 - MUL_2817;
    float MUL_2839 = SUB_2837 * 2.0;
    float MUL_2870 = MUL_2839 * 0.0033602;
    float ADD_2881 = MUL_2864 + MUL_2870;
    float ADD_2884 = ADD_2881 + MUL_2876;
    float ADD_2887 = ADD_564 + ADD_2884;
    float ADD_2831 = MUL_2821 + MUL_2817;
    float MUL_2833 = ADD_2831 * 2.0;
    float MUL_2866 = MUL_2833 * 0.0485274;
    float MUL_2820 = SUB_725 * ADD_708;
    float MUL_2823 = SUB_714 * ADD_720;
    float SUB_2853 = MUL_2823 - MUL_2820;
    float MUL_2855 = SUB_2853 * 2.0;
    float MUL_2878 = MUL_2855 * 0.0108239;
    float MUL_2819 = ADD_708 * ADD_708;
    float ADD_2840 = MUL_2816 + MUL_2819;
    float MUL_2843 = ADD_2840 * 2.0;
    float SUB_2846 = 1.0 - MUL_2843;
    float MUL_2872 = SUB_2846 * 0.0033602;
    float ADD_2882 = MUL_2866 + MUL_2872;
    float ADD_2885 = ADD_2882 + MUL_2878;
    float ADD_2888 = ADD_565 + ADD_2885;
    float SUB_2834 = MUL_2822 - MUL_2818;
    float ADD_2847 = MUL_2823 + MUL_2820;
    float ADD_2856 = MUL_2815 + MUL_2819;
    float MUL_2859 = ADD_2856 * 2.0;
    float SUB_2862 = 1.0 - MUL_2859;
    float MUL_2880 = SUB_2862 * 0.0108239;
    float MUL_2849 = ADD_2847 * 2.0;
    float MUL_2874 = MUL_2849 * 0.0033602;
    float MUL_2836 = SUB_2834 * 2.0;
    float MUL_2868 = MUL_2836 * 0.0485274;
    float ADD_2883 = MUL_2868 + MUL_2874;
    float ADD_2886 = ADD_2883 + MUL_2880;
    float ADD_2889 = ADD_566 + ADD_2886;
    float MUL_2916 = MUL_2839 * 0.01;
    float MUL_2909 = SUB_2830 * 0.08;
    float SUB_2932 = MUL_2909 - MUL_2916;
    float ADD_2935 = ADD_564 + SUB_2932;
    float MUL_2920 = SUB_2846 * 0.01;
    float MUL_2911 = MUL_2833 * 0.08;
    float SUB_2933 = MUL_2911 - MUL_2920;
    float ADD_2936 = ADD_565 + SUB_2933;
    float MUL_2924 = MUL_2849 * 0.01;
    float MUL_2913 = MUL_2836 * 0.08;
    float SUB_2934 = MUL_2913 - MUL_2924;
    float ADD_2937 = ADD_566 + SUB_2934;
    float MUL_2945 = MUL_2839 * 0.035;
    float ADD_2956 = MUL_2909 + MUL_2945;
    float ADD_2959 = ADD_564 + ADD_2956;
    float MUL_2947 = SUB_2846 * 0.035;
    float ADD_2957 = MUL_2911 + MUL_2947;
    float ADD_2960 = ADD_565 + ADD_2957;
    float MUL_2949 = MUL_2849 * 0.035;
    float ADD_2958 = MUL_2913 + MUL_2949;
    float ADD_2961 = ADD_566 + ADD_2958;
    if (/*panda_link0 vs. panda_link6*/ sphere_sphere_self_collision(
        -0.043343, 1.4e-06, 0.0629063, 0.130366, ADD_2887, ADD_2888, ADD_2889, 0.104795))
    {
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_564, ADD_565, ADD_566, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2935, ADD_2936, ADD_2937, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_2959, ADD_2960, ADD_2961, 0.052))
        {
            return false;
        }
    }  // (572, 665)
    if (/*panda_link1 vs. panda_link6*/ sphere_sphere_self_collision(
        ADD_1636, SUB_1637, 0.2598976, 0.144259, ADD_2887, ADD_2888, ADD_2889, 0.104795))
    {
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_564, ADD_565, ADD_566, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2935, ADD_2936, ADD_2937, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_2959, ADD_2960, ADD_2961, 0.052))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_564, ADD_565, ADD_566, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2935, ADD_2936, ADD_2937, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_2959, ADD_2960, ADD_2961, 0.052))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_564, ADD_565, ADD_566, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2935, ADD_2936, ADD_2937, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_2959, ADD_2960, ADD_2961, 0.052))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_564, ADD_565, ADD_566, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2935, ADD_2936, ADD_2937, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_2959, ADD_2960, ADD_2961, 0.052))
        {
            return false;
        }
    }  // (665, 665)
    if (/*panda_link6*/ sphere_environment_in_collision(
        environment, ADD_2887, ADD_2888, ADD_2889, 0.104795))
    {
        if (sphere_environment_in_collision(environment, ADD_564, ADD_565, ADD_566, 0.05))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2935, ADD_2936, ADD_2937, 0.05))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_2959, ADD_2960, ADD_2961, 0.052))
        {
            return false;
        }
    }  // (665, 665)
    float MUL_758 = SUB_725 * 0.7071068;
    float MUL_773 = ADD_720 * 0.7071068;
    float MUL_771 = SUB_714 * 0.7071068;
    float SUB_784 = MUL_773 - MUL_771;
    float ADD_774 = MUL_771 + MUL_773;
    float MUL_760 = ADD_708 * 0.7071068;
    float SUB_789 = MUL_758 - MUL_760;
    float ADD_761 = MUL_758 + MUL_760;
    float MUL_806 = ADD_720 * 0.088;
    float MUL_811 = ADD_720 * MUL_806;
    float MUL_801 = SUB_714 * 0.088;
    float MUL_809 = SUB_714 * MUL_801;
    float ADD_813 = MUL_809 + MUL_811;
    float MUL_816 = ADD_813 * 2.0;
    float SUB_819 = 0.088 - MUL_816;
    float ADD_838 = ADD_564 + SUB_819;
    float INPUT_6 = configurations[id * 7 + 6];
    float DIV_842 = INPUT_6 * 0.5;
    float SIN_843 = sin(DIV_842);
    float COS_849 = cos(DIV_842);
    float MUL_866 = SUB_789 * COS_849;
    float MUL_861 = SUB_789 * SIN_843;
    float MUL_864 = SUB_784 * COS_849;
    float ADD_865 = MUL_861 + MUL_864;
    float MUL_2971 = ADD_865 * ADD_865;
    float MUL_869 = SUB_784 * SIN_843;
    float SUB_870 = MUL_866 - MUL_869;
    float MUL_2972 = SUB_870 * ADD_865;
    float MUL_851 = ADD_761 * COS_849;
    float MUL_856 = ADD_761 * SIN_843;
    float MUL_858 = ADD_774 * COS_849;
    float SUB_859 = MUL_858 - MUL_856;
    float MUL_2973 = SUB_870 * SUB_859;
    float MUL_2970 = SUB_859 * SUB_859;
    float ADD_2979 = MUL_2970 + MUL_2971;
    float MUL_2982 = ADD_2979 * 2.0;
    float SUB_2985 = 1.0 - MUL_2982;
    float MUL_3019 = SUB_2985 * 0.0132698;
    float MUL_852 = ADD_774 * SIN_843;
    float ADD_853 = MUL_851 + MUL_852;
    float MUL_2977 = ADD_853 * ADD_865;
    float ADD_3005 = MUL_2977 + MUL_2973;
    float MUL_3007 = ADD_3005 * 2.0;
    float MUL_3031 = MUL_3007 * 0.0793978;
    float MUL_2976 = ADD_853 * SUB_859;
    float SUB_2992 = MUL_2976 - MUL_2972;
    float MUL_2994 = SUB_2992 * 2.0;
    float MUL_3025 = MUL_2994 * 0.0133909;
    float ADD_3036 = MUL_3019 + MUL_3025;
    float ADD_3039 = ADD_3036 + MUL_3031;
    float ADD_3042 = ADD_838 + ADD_3039;
    float ADD_2986 = MUL_2976 + MUL_2972;
    float MUL_2988 = ADD_2986 * 2.0;
    float MUL_3021 = MUL_2988 * 0.0132698;
    float MUL_2975 = SUB_870 * ADD_853;
    float MUL_2978 = SUB_859 * ADD_865;
    float SUB_3008 = MUL_2978 - MUL_2975;
    float MUL_3010 = SUB_3008 * 2.0;
    float MUL_3033 = MUL_3010 * 0.0793978;
    float MUL_2974 = ADD_853 * ADD_853;
    float ADD_2995 = MUL_2971 + MUL_2974;
    float MUL_2998 = ADD_2995 * 2.0;
    float SUB_3001 = 1.0 - MUL_2998;
    float MUL_3027 = SUB_3001 * 0.0133909;
    float ADD_3037 = MUL_3021 + MUL_3027;
    float ADD_3040 = ADD_3037 + MUL_3033;
    float MUL_821 = SUB_725 * MUL_806;
    float MUL_822 = ADD_708 * MUL_801;
    float ADD_824 = MUL_821 + MUL_822;
    float MUL_827 = ADD_824 * 2.0;
    float ADD_839 = ADD_565 + MUL_827;
    float ADD_3043 = ADD_839 + ADD_3040;
    float SUB_2989 = MUL_2977 - MUL_2973;
    float ADD_3002 = MUL_2978 + MUL_2975;
    float ADD_3011 = MUL_2970 + MUL_2974;
    float MUL_3014 = ADD_3011 * 2.0;
    float SUB_3017 = 1.0 - MUL_3014;
    float MUL_3035 = SUB_3017 * 0.0793978;
    float MUL_3004 = ADD_3002 * 2.0;
    float MUL_3029 = MUL_3004 * 0.0133909;
    float MUL_2991 = SUB_2989 * 2.0;
    float MUL_3023 = MUL_2991 * 0.0132698;
    float ADD_3038 = MUL_3023 + MUL_3029;
    float ADD_3041 = ADD_3038 + MUL_3035;
    float MUL_829 = SUB_725 * MUL_801;
    float MUL_831 = ADD_708 * MUL_806;
    float SUB_833 = MUL_831 - MUL_829;
    float MUL_836 = SUB_833 * 2.0;
    float ADD_840 = ADD_566 + MUL_836;
    float ADD_3044 = ADD_840 + ADD_3041;
    float MUL_3058 = MUL_3007 * 0.07;
    float ADD_3063 = ADD_838 + MUL_3058;
    float MUL_3060 = MUL_3010 * 0.07;
    float ADD_3064 = ADD_839 + MUL_3060;
    float MUL_3062 = SUB_3017 * 0.07;
    float ADD_3065 = ADD_840 + MUL_3062;
    float MUL_3079 = MUL_3007 * 0.08;
    float MUL_3067 = SUB_2985 * 0.02;
    float MUL_3073 = MUL_2994 * 0.04;
    float ADD_3084 = MUL_3067 + MUL_3073;
    float ADD_3087 = ADD_3084 + MUL_3079;
    float ADD_3090 = ADD_838 + ADD_3087;
    float MUL_3081 = MUL_3010 * 0.08;
    float MUL_3075 = SUB_3001 * 0.04;
    float MUL_3069 = MUL_2988 * 0.02;
    float ADD_3085 = MUL_3069 + MUL_3075;
    float ADD_3088 = ADD_3085 + MUL_3081;
    float ADD_3091 = ADD_839 + ADD_3088;
    float MUL_3083 = SUB_3017 * 0.08;
    float MUL_3077 = MUL_3004 * 0.04;
    float MUL_3071 = MUL_2991 * 0.02;
    float ADD_3086 = MUL_3071 + MUL_3077;
    float ADD_3089 = ADD_3086 + MUL_3083;
    float ADD_3092 = ADD_840 + ADD_3089;
    float MUL_3100 = MUL_2994 * 0.02;
    float MUL_3094 = SUB_2985 * 0.04;
    float ADD_3111 = MUL_3094 + MUL_3100;
    float ADD_3114 = ADD_3111 + MUL_3079;
    float ADD_3117 = ADD_838 + ADD_3114;
    float MUL_3102 = SUB_3001 * 0.02;
    float MUL_3096 = MUL_2988 * 0.04;
    float ADD_3112 = MUL_3096 + MUL_3102;
    float ADD_3115 = ADD_3112 + MUL_3081;
    float ADD_3118 = ADD_839 + ADD_3115;
    float MUL_3104 = MUL_3004 * 0.02;
    float MUL_3098 = MUL_2991 * 0.04;
    float ADD_3113 = MUL_3098 + MUL_3104;
    float ADD_3116 = ADD_3113 + MUL_3083;
    float ADD_3119 = ADD_840 + ADD_3116;
    float MUL_3133 = MUL_3007 * 0.085;
    float MUL_3127 = MUL_2994 * 0.06;
    float ADD_3138 = MUL_3094 + MUL_3127;
    float ADD_3141 = ADD_3138 + MUL_3133;
    float ADD_3144 = ADD_838 + ADD_3141;
    float MUL_3135 = MUL_3010 * 0.085;
    float MUL_3129 = SUB_3001 * 0.06;
    float ADD_3139 = MUL_3096 + MUL_3129;
    float ADD_3142 = ADD_3139 + MUL_3135;
    float ADD_3145 = ADD_839 + ADD_3142;
    float MUL_3137 = SUB_3017 * 0.085;
    float MUL_3131 = MUL_3004 * 0.06;
    float ADD_3140 = MUL_3098 + MUL_3131;
    float ADD_3143 = ADD_3140 + MUL_3137;
    float ADD_3146 = ADD_840 + ADD_3143;
    float MUL_3148 = SUB_2985 * 0.06;
    float ADD_3165 = MUL_3148 + MUL_3073;
    float ADD_3168 = ADD_3165 + MUL_3133;
    float ADD_3171 = ADD_838 + ADD_3168;
    float MUL_3150 = MUL_2988 * 0.06;
    float ADD_3166 = MUL_3150 + MUL_3075;
    float ADD_3169 = ADD_3166 + MUL_3135;
    float ADD_3172 = ADD_839 + ADD_3169;
    float MUL_3152 = MUL_2991 * 0.06;
    float ADD_3167 = MUL_3152 + MUL_3077;
    float ADD_3170 = ADD_3167 + MUL_3137;
    float ADD_3173 = ADD_840 + ADD_3170;
    if (/*panda_link0 vs. panda_link7*/ sphere_sphere_self_collision(
        -0.043343, 1.4e-06, 0.0629063, 0.130366, ADD_3042, ADD_3043, ADD_3044, 0.073242))
    {
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
    }  // (665, 821)
    if (/*panda_link1 vs. panda_link7*/ sphere_sphere_self_collision(
        ADD_1636, SUB_1637, 0.2598976, 0.144259, ADD_3042, ADD_3043, ADD_3044, 0.073242))
    {
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
    }  // (821, 821)
    if (/*panda_link2 vs. panda_link7*/ sphere_sphere_self_collision(
        ADD_1835, SUB_1836, ADD_1838, 0.145067, ADD_3042, ADD_3043, ADD_3044, 0.073242))
    {
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
    }  // (821, 821)
    if (/*panda_link5 vs. panda_link7*/ sphere_sphere_self_collision(
        ADD_2399, ADD_2400, ADD_2401, 0.173531, ADD_3042, ADD_3043, ADD_3044, 0.073242))
    {
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
    }  // (821, 821)
    if (/*panda_link7*/ sphere_environment_in_collision(
        environment, ADD_3042, ADD_3043, ADD_3044, 0.073242))
    {
        if (sphere_environment_in_collision(environment, ADD_3063, ADD_3064, ADD_3065, 0.05))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3090, ADD_3091, ADD_3092, 0.025))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3117, ADD_3118, ADD_3119, 0.025))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3144, ADD_3145, ADD_3146, 0.02))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3171, ADD_3172, ADD_3173, 0.02))
        {
            return false;
        }
    }  // (821, 821)
    float MUL_1065 = SUB_870 * 0.9238795;
    float MUL_1062 = ADD_865 * 0.9238795;
    float MUL_1049 = SUB_859 * 0.9238795;
    float MUL_1034 = ADD_853 * 0.9238795;
    float MUL_1055 = SUB_870 * 0.3826834;
    float SUB_1063 = MUL_1062 - MUL_1055;
    float MUL_3235 = SUB_1063 * SUB_1063;
    float MUL_1072 = ADD_865 * 0.3826834;
    float ADD_1074 = MUL_1065 + MUL_1072;
    float MUL_3236 = ADD_1074 * SUB_1063;
    float MUL_1037 = SUB_859 * 0.3826834;
    float SUB_1039 = MUL_1034 - MUL_1037;
    float MUL_3241 = SUB_1039 * SUB_1063;
    float MUL_1046 = ADD_853 * 0.3826834;
    float ADD_1050 = MUL_1046 + MUL_1049;
    float MUL_3237 = ADD_1074 * ADD_1050;
    float ADD_3269 = MUL_3241 + MUL_3237;
    float MUL_3271 = ADD_3269 * 2.0;
    float MUL_3240 = SUB_1039 * ADD_1050;
    float SUB_3256 = MUL_3240 - MUL_3236;
    float MUL_3258 = SUB_3256 * 2.0;
    float MUL_3234 = ADD_1050 * ADD_1050;
    float ADD_3243 = MUL_3234 + MUL_3235;
    float MUL_3246 = ADD_3243 * 2.0;
    float SUB_3249 = 1.0 - MUL_3246;
    float MUL_931 = SUB_859 * 0.107;
    float MUL_942 = SUB_870 * MUL_931;
    float MUL_939 = ADD_853 * 0.107;
    float MUL_944 = ADD_865 * MUL_939;
    float ADD_945 = MUL_942 + MUL_944;
    float MUL_947 = ADD_945 * 2.0;
    float ADD_969 = ADD_838 + MUL_947;
    float MUL_3301 = MUL_3271 * 0.0196227;
    float MUL_3295 = MUL_3258 * 2.7e-05;
    float MUL_3284 = SUB_3249 * 5.1e-06;
    float SUB_3306 = MUL_3295 - MUL_3284;
    float ADD_3309 = SUB_3306 + MUL_3301;
    float ADD_3312 = ADD_969 + ADD_3309;
    float ADD_3250 = MUL_3240 + MUL_3236;
    float MUL_3252 = ADD_3250 * 2.0;
    float MUL_3288 = MUL_3252 * 5.1e-06;
    float MUL_3239 = ADD_1074 * SUB_1039;
    float MUL_3238 = SUB_1039 * SUB_1039;
    float ADD_3259 = MUL_3235 + MUL_3238;
    float MUL_3262 = ADD_3259 * 2.0;
    float SUB_3265 = 1.0 - MUL_3262;
    float MUL_3297 = SUB_3265 * 2.7e-05;
    float SUB_3307 = MUL_3297 - MUL_3288;
    float MUL_3242 = ADD_1050 * SUB_1063;
    float SUB_3272 = MUL_3242 - MUL_3239;
    float MUL_3274 = SUB_3272 * 2.0;
    float MUL_3303 = MUL_3274 * 0.0196227;
    float ADD_3310 = SUB_3307 + MUL_3303;
    float MUL_950 = SUB_870 * MUL_939;
    float MUL_953 = ADD_865 * MUL_931;
    float SUB_954 = MUL_953 - MUL_950;
    float MUL_956 = SUB_954 * 2.0;
    float ADD_970 = ADD_839 + MUL_956;
    float ADD_3313 = ADD_970 + ADD_3310;
    float SUB_3253 = MUL_3241 - MUL_3237;
    float ADD_3266 = MUL_3242 + MUL_3239;
    float ADD_3275 = MUL_3234 + MUL_3238;
    float MUL_3278 = ADD_3275 * 2.0;
    float SUB_3281 = 1.0 - MUL_3278;
    float MUL_3305 = SUB_3281 * 0.0196227;
    float MUL_3268 = ADD_3266 * 2.0;
    float MUL_3299 = MUL_3268 * 2.7e-05;
    float MUL_3255 = SUB_3253 * 2.0;
    float MUL_3292 = MUL_3255 * 5.1e-06;
    float SUB_3308 = MUL_3299 - MUL_3292;
    float ADD_3311 = SUB_3308 + MUL_3305;
    float MUL_961 = SUB_859 * MUL_931;
    float MUL_959 = ADD_853 * MUL_939;
    float ADD_962 = MUL_959 + MUL_961;
    float MUL_965 = ADD_962 * 2.0;
    float SUB_968 = 0.107 - MUL_965;
    float ADD_971 = ADD_840 + SUB_968;
    float ADD_3314 = ADD_971 + ADD_3311;
    float MUL_3334 = MUL_3271 * 0.01;
    float MUL_3323 = MUL_3258 * 0.075;
    float SUB_3339 = MUL_3334 - MUL_3323;
    float ADD_3342 = ADD_969 + SUB_3339;
    float MUL_3336 = MUL_3274 * 0.01;
    float MUL_3327 = SUB_3265 * 0.075;
    float SUB_3340 = MUL_3336 - MUL_3327;
    float ADD_3343 = ADD_970 + SUB_3340;
    float MUL_3338 = SUB_3281 * 0.01;
    float MUL_3331 = MUL_3268 * 0.075;
    float SUB_3341 = MUL_3338 - MUL_3331;
    float ADD_3344 = ADD_971 + SUB_3341;
    float MUL_3353 = MUL_3258 * 0.045;
    float SUB_3369 = MUL_3334 - MUL_3353;
    float ADD_3372 = ADD_969 + SUB_3369;
    float MUL_3357 = SUB_3265 * 0.045;
    float SUB_3370 = MUL_3336 - MUL_3357;
    float ADD_3373 = ADD_970 + SUB_3370;
    float MUL_3361 = MUL_3268 * 0.045;
    float SUB_3371 = MUL_3338 - MUL_3361;
    float ADD_3374 = ADD_971 + SUB_3371;
    float MUL_3383 = MUL_3258 * 0.015;
    float SUB_3399 = MUL_3334 - MUL_3383;
    float ADD_3402 = ADD_969 + SUB_3399;
    float MUL_3387 = SUB_3265 * 0.015;
    float SUB_3400 = MUL_3336 - MUL_3387;
    float ADD_3403 = ADD_970 + SUB_3400;
    float MUL_3391 = MUL_3268 * 0.015;
    float SUB_3401 = MUL_3338 - MUL_3391;
    float ADD_3404 = ADD_971 + SUB_3401;
    float ADD_3423 = MUL_3383 + MUL_3334;
    float ADD_3426 = ADD_969 + ADD_3423;
    float ADD_3424 = MUL_3387 + MUL_3336;
    float ADD_3427 = ADD_970 + ADD_3424;
    float ADD_3425 = MUL_3391 + MUL_3338;
    float ADD_3428 = ADD_971 + ADD_3425;
    float ADD_3447 = MUL_3353 + MUL_3334;
    float ADD_3450 = ADD_969 + ADD_3447;
    float ADD_3448 = MUL_3357 + MUL_3336;
    float ADD_3451 = ADD_970 + ADD_3448;
    float ADD_3449 = MUL_3361 + MUL_3338;
    float ADD_3452 = ADD_971 + ADD_3449;
    float ADD_3471 = MUL_3323 + MUL_3334;
    float ADD_3474 = ADD_969 + ADD_3471;
    float ADD_3472 = MUL_3327 + MUL_3336;
    float ADD_3475 = ADD_970 + ADD_3472;
    float ADD_3473 = MUL_3331 + MUL_3338;
    float ADD_3476 = ADD_971 + ADD_3473;
    float MUL_3496 = MUL_3271 * 0.03;
    float SUB_3501 = MUL_3496 - MUL_3323;
    float ADD_3504 = ADD_969 + SUB_3501;
    float MUL_3498 = MUL_3274 * 0.03;
    float SUB_3502 = MUL_3498 - MUL_3327;
    float ADD_3505 = ADD_970 + SUB_3502;
    float MUL_3500 = SUB_3281 * 0.03;
    float SUB_3503 = MUL_3500 - MUL_3331;
    float ADD_3506 = ADD_971 + SUB_3503;
    float SUB_3531 = MUL_3496 - MUL_3353;
    float ADD_3534 = ADD_969 + SUB_3531;
    float SUB_3532 = MUL_3498 - MUL_3357;
    float ADD_3535 = ADD_970 + SUB_3532;
    float SUB_3533 = MUL_3500 - MUL_3361;
    float ADD_3536 = ADD_971 + SUB_3533;
    float SUB_3561 = MUL_3496 - MUL_3383;
    float ADD_3564 = ADD_969 + SUB_3561;
    float SUB_3562 = MUL_3498 - MUL_3387;
    float ADD_3565 = ADD_970 + SUB_3562;
    float SUB_3563 = MUL_3500 - MUL_3391;
    float ADD_3566 = ADD_971 + SUB_3563;
    float ADD_3585 = MUL_3383 + MUL_3496;
    float ADD_3588 = ADD_969 + ADD_3585;
    float ADD_3586 = MUL_3387 + MUL_3498;
    float ADD_3589 = ADD_970 + ADD_3586;
    float ADD_3587 = MUL_3391 + MUL_3500;
    float ADD_3590 = ADD_971 + ADD_3587;
    float ADD_3609 = MUL_3353 + MUL_3496;
    float ADD_3612 = ADD_969 + ADD_3609;
    float ADD_3610 = MUL_3357 + MUL_3498;
    float ADD_3613 = ADD_970 + ADD_3610;
    float ADD_3611 = MUL_3361 + MUL_3500;
    float ADD_3614 = ADD_971 + ADD_3611;
    float ADD_3633 = MUL_3323 + MUL_3496;
    float ADD_3636 = ADD_969 + ADD_3633;
    float ADD_3634 = MUL_3327 + MUL_3498;
    float ADD_3637 = ADD_970 + ADD_3634;
    float ADD_3635 = MUL_3331 + MUL_3500;
    float ADD_3638 = ADD_971 + ADD_3635;
    float MUL_3658 = MUL_3271 * 0.05;
    float SUB_3663 = MUL_3658 - MUL_3323;
    float ADD_3666 = ADD_969 + SUB_3663;
    float MUL_3660 = MUL_3274 * 0.05;
    float SUB_3664 = MUL_3660 - MUL_3327;
    float ADD_3667 = ADD_970 + SUB_3664;
    float MUL_3662 = SUB_3281 * 0.05;
    float SUB_3665 = MUL_3662 - MUL_3331;
    float ADD_3668 = ADD_971 + SUB_3665;
    float SUB_3693 = MUL_3658 - MUL_3353;
    float ADD_3696 = ADD_969 + SUB_3693;
    float SUB_3694 = MUL_3660 - MUL_3357;
    float ADD_3697 = ADD_970 + SUB_3694;
    float SUB_3695 = MUL_3662 - MUL_3361;
    float ADD_3698 = ADD_971 + SUB_3695;
    float SUB_3723 = MUL_3658 - MUL_3383;
    float ADD_3726 = ADD_969 + SUB_3723;
    float SUB_3724 = MUL_3660 - MUL_3387;
    float ADD_3727 = ADD_970 + SUB_3724;
    float SUB_3725 = MUL_3662 - MUL_3391;
    float ADD_3728 = ADD_971 + SUB_3725;
    float ADD_3747 = MUL_3383 + MUL_3658;
    float ADD_3750 = ADD_969 + ADD_3747;
    float ADD_3748 = MUL_3387 + MUL_3660;
    float ADD_3751 = ADD_970 + ADD_3748;
    float ADD_3749 = MUL_3391 + MUL_3662;
    float ADD_3752 = ADD_971 + ADD_3749;
    float ADD_3771 = MUL_3353 + MUL_3658;
    float ADD_3774 = ADD_969 + ADD_3771;
    float ADD_3772 = MUL_3357 + MUL_3660;
    float ADD_3775 = ADD_970 + ADD_3772;
    float ADD_3773 = MUL_3361 + MUL_3662;
    float ADD_3776 = ADD_971 + ADD_3773;
    float ADD_3795 = MUL_3323 + MUL_3658;
    float ADD_3798 = ADD_969 + ADD_3795;
    float ADD_3796 = MUL_3327 + MUL_3660;
    float ADD_3799 = ADD_970 + ADD_3796;
    float ADD_3797 = MUL_3331 + MUL_3662;
    float ADD_3800 = ADD_971 + ADD_3797;
    if (/*panda_hand*/ sphere_environment_in_collision(
        environment, ADD_3312, ADD_3313, ADD_3314, 0.107701))
    {
        if (sphere_environment_in_collision(environment, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
    }  // (821, 1025)
    if (/*panda_link0 vs. panda_hand*/ sphere_sphere_self_collision(
        -0.043343, 1.4e-06, 0.0629063, 0.130366, ADD_3312, ADD_3313, ADD_3314, 0.107701))
    {
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
    }  // (1025, 1025)
    if (/*panda_link1 vs. panda_hand*/ sphere_sphere_self_collision(
        ADD_1636, SUB_1637, 0.2598976, 0.144259, ADD_3312, ADD_3313, ADD_3314, 0.107701))
    {
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
    }  // (1025, 1025)
    if (/*panda_link2 vs. panda_hand*/ sphere_sphere_self_collision(
        ADD_1835, SUB_1836, ADD_1838, 0.145067, ADD_3312, ADD_3313, ADD_3314, 0.107701))
    {
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
    }  // (1025, 1025)
    if (/*panda_link5 vs. panda_hand*/ sphere_sphere_self_collision(
        ADD_2399, ADD_2400, ADD_2401, 0.173531, ADD_3312, ADD_3313, ADD_3314, 0.107701))
    {
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3342, ADD_3343, ADD_3344, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3372, ADD_3373, ADD_3374, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3402, ADD_3403, ADD_3404, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3426, ADD_3427, ADD_3428, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3450, ADD_3451, ADD_3452, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3474, ADD_3475, ADD_3476, 0.028))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3504, ADD_3505, ADD_3506, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3534, ADD_3535, ADD_3536, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3564, ADD_3565, ADD_3566, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3588, ADD_3589, ADD_3590, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3612, ADD_3613, ADD_3614, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3636, ADD_3637, ADD_3638, 0.026))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3666, ADD_3667, ADD_3668, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3696, ADD_3697, ADD_3698, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3726, ADD_3727, ADD_3728, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3750, ADD_3751, ADD_3752, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3774, ADD_3775, ADD_3776, 0.024))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3798, ADD_3799, ADD_3800, 0.024))
        {
            return false;
        }
    }  // (1025, 1025)
    float MUL_3876 = ADD_3269 * 2.0;
    float MUL_3863 = SUB_3256 * 2.0;
    float MUL_3851 = ADD_3243 * 2.0;
    float SUB_3854 = 1.0 - MUL_3851;
    float MUL_1196 = SUB_1063 * 0.065;
    float MUL_1199 = SUB_1039 * 0.065;
    float MUL_1207 = ADD_1050 * MUL_1199;
    float MUL_1203 = SUB_1039 * 0.0584;
    float MUL_1209 = SUB_1063 * MUL_1203;
    float MUL_1194 = ADD_1050 * 0.0584;
    float SUB_1197 = MUL_1194 - MUL_1196;
    float MUL_1206 = ADD_1074 * SUB_1197;
    float ADD_1208 = MUL_1206 + MUL_1207;
    float ADD_1210 = ADD_1208 + MUL_1209;
    float MUL_1212 = ADD_1210 * 2.0;
    float ADD_1235 = ADD_969 + MUL_1212;
    float MUL_3906 = MUL_3876 * 0.0261043;
    float MUL_3900 = MUL_3863 * 0.0129294;
    float MUL_3889 = SUB_3854 * 4.3e-06;
    float SUB_3911 = MUL_3900 - MUL_3889;
    float ADD_3914 = SUB_3911 + MUL_3906;
    float ADD_3917 = ADD_1235 + ADD_3914;
    float MUL_3879 = SUB_3272 * 2.0;
    float MUL_3908 = MUL_3879 * 0.0261043;
    float MUL_3867 = ADD_3259 * 2.0;
    float SUB_3870 = 1.0 - MUL_3867;
    float MUL_3902 = SUB_3870 * 0.0129294;
    float MUL_3857 = ADD_3250 * 2.0;
    float MUL_3893 = MUL_3857 * 4.3e-06;
    float SUB_3912 = MUL_3902 - MUL_3893;
    float ADD_3915 = SUB_3912 + MUL_3908;
    float MUL_1215 = ADD_1074 * MUL_1203;
    float MUL_1220 = SUB_1063 * SUB_1197;
    float MUL_1217 = SUB_1039 * MUL_1199;
    float ADD_1218 = MUL_1215 + MUL_1217;
    float SUB_1221 = MUL_1220 - ADD_1218;
    float MUL_1223 = SUB_1221 * 2.0;
    float ADD_1225 = MUL_1223 + 0.065;
    float ADD_1236 = ADD_970 + ADD_1225;
    float ADD_3918 = ADD_1236 + ADD_3915;
    float MUL_3883 = ADD_3275 * 2.0;
    float SUB_3886 = 1.0 - MUL_3883;
    float MUL_3910 = SUB_3886 * 0.0261043;
    float MUL_3873 = ADD_3266 * 2.0;
    float MUL_3904 = MUL_3873 * 0.0129294;
    float MUL_3860 = SUB_3253 * 2.0;
    float MUL_3897 = MUL_3860 * 4.3e-06;
    float SUB_3913 = MUL_3904 - MUL_3897;
    float ADD_3916 = SUB_3913 + MUL_3910;
    float MUL_1226 = ADD_1074 * MUL_1199;
    float MUL_1227 = SUB_1039 * MUL_1203;
    float SUB_1228 = MUL_1226 - MUL_1227;
    float MUL_1229 = ADD_1050 * SUB_1197;
    float SUB_1230 = SUB_1228 - MUL_1229;
    float MUL_1232 = SUB_1230 * 2.0;
    float ADD_1234 = MUL_1232 + 0.0584;
    float ADD_1237 = ADD_971 + ADD_1234;
    float ADD_3919 = ADD_1237 + ADD_3916;
    float MUL_3927 = MUL_3863 * 0.015;
    float MUL_3933 = MUL_3876 * 0.022;
    float ADD_3938 = MUL_3927 + MUL_3933;
    float ADD_3941 = ADD_1235 + ADD_3938;
    float MUL_3935 = MUL_3879 * 0.022;
    float MUL_3929 = SUB_3870 * 0.015;
    float ADD_3939 = MUL_3929 + MUL_3935;
    float ADD_3942 = ADD_1236 + ADD_3939;
    float MUL_3937 = SUB_3886 * 0.022;
    float MUL_3931 = MUL_3873 * 0.015;
    float ADD_3940 = MUL_3931 + MUL_3937;
    float ADD_3943 = ADD_1237 + ADD_3940;
    float MUL_3957 = MUL_3876 * 0.044;
    float MUL_3951 = MUL_3863 * 0.008;
    float ADD_3962 = MUL_3951 + MUL_3957;
    float ADD_3965 = ADD_1235 + ADD_3962;
    float MUL_3959 = MUL_3879 * 0.044;
    float MUL_3953 = SUB_3870 * 0.008;
    float ADD_3963 = MUL_3953 + MUL_3959;
    float ADD_3966 = ADD_1236 + ADD_3963;
    float MUL_3961 = SUB_3886 * 0.044;
    float MUL_3955 = MUL_3873 * 0.008;
    float ADD_3964 = MUL_3955 + MUL_3961;
    float ADD_3967 = ADD_1237 + ADD_3964;
    if (/*panda_leftfinger*/ sphere_environment_in_collision(
        environment, ADD_3917, ADD_3918, ADD_3919, 0.031022))
    {
        if (sphere_environment_in_collision(environment, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
    }  // (1025, 1107)
    if (/*panda_link0 vs. panda_leftfinger*/ sphere_sphere_self_collision(
        -0.043343, 1.4e-06, 0.0629063, 0.130366, ADD_3917, ADD_3918, ADD_3919, 0.031022))
    {
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
    }  // (1107, 1107)
    if (/*panda_link1 vs. panda_leftfinger*/ sphere_sphere_self_collision(
        ADD_1636, SUB_1637, 0.2598976, 0.144259, ADD_3917, ADD_3918, ADD_3919, 0.031022))
    {
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
    }  // (1107, 1107)
    if (/*panda_link2 vs. panda_leftfinger*/ sphere_sphere_self_collision(
        ADD_1835, SUB_1836, ADD_1838, 0.145067, ADD_3917, ADD_3918, ADD_3919, 0.031022))
    {
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
    }  // (1107, 1107)
    if (/*panda_link5 vs. panda_leftfinger*/ sphere_sphere_self_collision(
        ADD_2399, ADD_2400, ADD_2401, 0.173531, ADD_3917, ADD_3918, ADD_3919, 0.031022))
    {
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3941, ADD_3942, ADD_3943, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_3965, ADD_3966, ADD_3967, 0.012))
        {
            return false;
        }
    }  // (1107, 1107)
    float ADD_1331 = MUL_1194 + MUL_1196;
    float MUL_4011 = ADD_3269 * 2.0;
    float MUL_3998 = SUB_3256 * 2.0;
    float MUL_3986 = ADD_3243 * 2.0;
    float SUB_3989 = 1.0 - MUL_3986;
    float MUL_1342 = ADD_1074 * ADD_1331;
    float SUB_1345 = MUL_1342 - MUL_1207;
    float ADD_1347 = SUB_1345 + MUL_1209;
    float MUL_1349 = ADD_1347 * 2.0;
    float ADD_1377 = ADD_969 + MUL_1349;
    float MUL_4041 = MUL_4011 * 0.0261203;
    float MUL_4030 = MUL_3998 * 0.0129624;
    float MUL_4023 = SUB_3989 * 5.4e-06;
    float SUB_4046 = MUL_4023 - MUL_4030;
    float ADD_4049 = SUB_4046 + MUL_4041;
    float ADD_4052 = ADD_1377 + ADD_4049;
    float SUB_1356 = MUL_1217 - MUL_1215;
    float MUL_4014 = SUB_3272 * 2.0;
    float MUL_4043 = MUL_4014 * 0.0261203;
    float MUL_4002 = ADD_3259 * 2.0;
    float SUB_4005 = 1.0 - MUL_4002;
    float MUL_4034 = SUB_4005 * 0.0129624;
    float MUL_3992 = ADD_3250 * 2.0;
    float MUL_4025 = MUL_3992 * 5.4e-06;
    float SUB_4047 = MUL_4025 - MUL_4034;
    float ADD_4050 = SUB_4047 + MUL_4043;
    float MUL_1357 = SUB_1063 * ADD_1331;
    float ADD_1358 = SUB_1356 + MUL_1357;
    float MUL_1360 = ADD_1358 * 2.0;
    float SUB_1363 = MUL_1360 - 0.065;
    float ADD_1378 = ADD_970 + SUB_1363;
    float ADD_4053 = ADD_1378 + ADD_4050;
    float ADD_1367 = MUL_1226 + MUL_1227;
    float MUL_4018 = ADD_3275 * 2.0;
    float SUB_4021 = 1.0 - MUL_4018;
    float MUL_4045 = SUB_4021 * 0.0261203;
    float MUL_4008 = ADD_3266 * 2.0;
    float MUL_4038 = MUL_4008 * 0.0129624;
    float MUL_3995 = SUB_3253 * 2.0;
    float MUL_4027 = MUL_3995 * 5.4e-06;
    float SUB_4048 = MUL_4027 - MUL_4038;
    float ADD_4051 = SUB_4048 + MUL_4045;
    float MUL_1369 = ADD_1050 * ADD_1331;
    float ADD_1370 = ADD_1367 + MUL_1369;
    float MUL_1373 = ADD_1370 * 2.0;
    float SUB_1376 = 0.0584 - MUL_1373;
    float ADD_1379 = ADD_971 + SUB_1376;
    float ADD_4054 = ADD_1379 + ADD_4051;
    float MUL_4074 = MUL_4011 * 0.022;
    float MUL_4063 = MUL_3998 * 0.015;
    float SUB_4079 = MUL_4074 - MUL_4063;
    float ADD_4082 = ADD_1377 + SUB_4079;
    float MUL_4076 = MUL_4014 * 0.022;
    float MUL_4067 = SUB_4005 * 0.015;
    float SUB_4080 = MUL_4076 - MUL_4067;
    float ADD_4083 = ADD_1378 + SUB_4080;
    float MUL_4078 = SUB_4021 * 0.022;
    float MUL_4071 = MUL_4008 * 0.015;
    float SUB_4081 = MUL_4078 - MUL_4071;
    float ADD_4084 = ADD_1379 + SUB_4081;
    float MUL_4104 = MUL_4011 * 0.044;
    float MUL_4093 = MUL_3998 * 0.008;
    float SUB_4109 = MUL_4104 - MUL_4093;
    float ADD_4112 = ADD_1377 + SUB_4109;
    float MUL_4106 = MUL_4014 * 0.044;
    float MUL_4097 = SUB_4005 * 0.008;
    float SUB_4110 = MUL_4106 - MUL_4097;
    float ADD_4113 = ADD_1378 + SUB_4110;
    float MUL_4108 = SUB_4021 * 0.044;
    float MUL_4101 = MUL_4008 * 0.008;
    float SUB_4111 = MUL_4108 - MUL_4101;
    float ADD_4114 = ADD_1379 + SUB_4111;
    if (/*panda_link0 vs. panda_rightfinger*/ sphere_sphere_self_collision(
        -0.043343, 1.4e-06, 0.0629063, 0.130366, ADD_4052, ADD_4053, ADD_4054, 0.031022))
    {
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.05, 0.08, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
    }  // (1107, 1179)
    if (/*panda_link1 vs. panda_rightfinger*/ sphere_sphere_self_collision(
        ADD_1636, SUB_1637, 0.2598976, 0.144259, ADD_4052, ADD_4053, ADD_4054, 0.031022))
    {
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1650, NEGATE_1654, 0.333, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1674, NEGATE_1678, 0.333, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.213, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                0.0, 0.0, 0.163, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
    }  // (1179, 1179)
    if (/*panda_link2 vs. panda_rightfinger*/ sphere_sphere_self_collision(
        ADD_1835, SUB_1836, ADD_1838, 0.145067, ADD_4052, ADD_4053, ADD_4054, 0.031022))
    {
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1852, MUL_1854, ADD_1857, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1871, MUL_1873, ADD_1876, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1885, NEGATE_1889, SUB_1900, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                MUL_1909, NEGATE_1913, SUB_1924, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
    }  // (1179, 1179)
    if (/*panda_link5 vs. panda_rightfinger*/ sphere_sphere_self_collision(
        ADD_2399, ADD_2400, ADD_2401, 0.173531, ADD_4052, ADD_4053, ADD_4054, 0.031022))
    {
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2420, ADD_2421, ADD_2422, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2441, ADD_2442, ADD_2443, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                SUB_2468, SUB_2469, SUB_2470, 0.06, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2498, ADD_2499, ADD_2500, 0.05, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2531, ADD_2532, ADD_2533, 0.025, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2564, ADD_2565, ADD_2566, 0.025, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2597, ADD_2598, ADD_2599, 0.025, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2630, ADD_2631, ADD_2632, 0.025, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2669, ADD_2670, ADD_2671, 0.025, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2708, ADD_2709, ADD_2710, 0.025, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2747, ADD_2748, ADD_2749, 0.025, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_sphere_self_collision(
                ADD_2786, ADD_2787, ADD_2788, 0.025, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
    }  // (1179, 1179)
    if (/*panda_rightfinger*/ sphere_environment_in_collision(
        environment, ADD_4052, ADD_4053, ADD_4054, 0.031022))
    {
        if (sphere_environment_in_collision(environment, ADD_4082, ADD_4083, ADD_4084, 0.012))
        {
            return false;
        }
        if (sphere_environment_in_collision(environment, ADD_4112, ADD_4113, ADD_4114, 0.012))
        {
            return false;
        }
    }  // (1179, 1179)
    return true;
}


kernel void panda_cc(
    constant metal_shapes::Environment *environment [[buffer(0)]],
    constant float *configurations [[buffer(1)]],
    constant CollisionKernelArgs *args [[buffer(2)]],
    device bool *out [[buffer(3)]],
    uint id [[thread_position_in_grid]])
{
    out[id] = panda_cc_internal(environment, configurations, args, id);
}