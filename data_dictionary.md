
|     | Variable Name             | Definition                                                                          |
|----:|:--------------------------|:------------------------------------------------------------------------------------|
|   0 | date_m                    | The date of the first day of the month in form YYYY-MM-DD                           |
|   1 | year                      | The year of the month in form YYYY                                                  |
|   2 | INDPRO                    | The year of the month in form YYYY                                                  |
|   3 | PCEPI                     | Value of the personal consumption expenditure price index                           |
|   4 | PCEPI_PCA                 | Value of the personal consumption expenditure price index-                          |
|   5 | inflation                 | Value of the PCEPI_PCH                                                              |
|   6 | unemp                     | Value of unemployment for the month                                                 |
|   7 | lagged_unemp              | Value of unemployment for the previous month                                        |
|   8 | market_exp                | Contains the current Market Expectations, given by derived_monthly_market_exp       |
|   9 | target_change             | Contains the change in the fed target rate for that month                           |
|  10 | lag_DFEDTAR               | Contains the value of the fed target rate for the previous month                    |
|  11 | DFEDTAR                   | Contains the value of the fed target rate for that month                            |
|  12 | d_meeting                 | Dummy variable representing the occurance of a meeting in the month                 |
|  13 | scale                     | Scale variable for action based on day of the month of meeting                      |
|  14 | d_crisis                  | Dummy variable for values after 2006-08-01                                          |
|  15 | TRY_3M                    | Value of treasury bonds with three month maturity                                   |
|  16 | TRY_2Y                    | Value of treasury bonds with two year maturity                                      |
|  17 | TRY_10Y                   | Value of treasury bonds with two year maturity                                      |
|  18 | FF_TAR                    | Value of federal funds target rate                                                      
|  20 | d_menu_dec                | Dummy for occurrence of decreased fed target option in policy menu                  |
|  21 | d_menu_unc                | Dummy for occurrence of unchanged fed target option in policy menu                  |
|  22 | d_menu_inc                | Dummy for occurrence of increased fed target option in policy menu                  |
|  23 | d_menu_m075               | Dummy for occurrence of -0.75% fed target option in policy menu                     |
|  24 | d_menu_m050               | Dummy for occurrence of -0.50% fed target option in policy menu                     |
|  25 | d_menu_m025               | Dummy for occurrence of -0.25% fed target option in policy menu                     |
|  26 | d_menu_0                  | Dummy for occurrence of 0.0% fed target option in policy menu                       |
|  27 | d_menu_025                | Dummy for occurrence of +0.25% fed target option in policy menu                     |
|  28 | d_menu_050                | Dummy for occurrence of +0.50% fed target option in policy menu                     |
|  29 | d_menu_075                | Dummy for occurrence of -0.75% fed target option in policy menu                     |
|  30 | ord_policy                | Ordinal Value for target change                                                     |
|  31 | d_nineeleven              | Dummy for 9/11 terror attacks                                                       |
|  32 | date                      | The date of the first day of the month in format MM/DD/YY                           |
|  33 | d_month_1                 | Dummy for month of row                                                              |
|  34 | d_month_2                 | Dummy for month of row                                                              |
|  35 | d_month_3                 | Dummy for month of row                                                              |
|  36 | d_month_4                 | Dummy for month of row                                                              |
|  37 | d_month_5                 | Dummy for month of row                                                              |
|  38 | d_month_6                 | Dummy for month of row                                                              |
|  39 | d_month_7                 | Dummy for month of row                                                              |
|  40 | d_month_8                 | Dummy for month of row                                                              |
|  41 | d_month_9                 | Dummy for month of row                                                              |
|  42 | d_month_10                | Dummy for month of row                                                              |
|  43 | d_month_11                | Dummy for month of row                                                              |
|  44 | d_month_12                | Dummy for month of row                                                              |
|  45 | d_month_1_fomc            | Dummy for occurrence of meeting in month                                            |
|  46 | d_month_2_fomc            | Dummy for occurrence of meeting in month                                            |
|  47 | d_month_3_fomc            | Dummy for occurrence of meeting in month                                            |
|  48 | d_month_4_fomc            | Dummy for occurrence of meeting in month                                            |
|  49 | d_month_5_fomc            | Dummy for occurrence of meeting in month                                            |
|  50 | d_month_6_fomc            | Dummy for occurrence of meeting in month                                            |
|  51 | d_month_7_fomc            | Dummy for occurrence of meeting in month                                            |
|  52 | d_month_8_fomc            | Dummy for occurrence of meeting in month                                            |
|  53 | d_month_9_fomc            | Dummy for occurrence of meeting in month                                            |
|  54 | d_month_10_fomc           | Dummy for occurrence of meeting in month                                            |
|  55 | d_month_11_fomc           | Dummy for occurrence of meeting in month                                            |
|  56 | d_month_12_fomc           | Dummy for occurrence of meeting in month                                            |
|  57 | target_change_last        | Target change of last meeting                                                       |
|  58 | target_change_last_fomc   | Target change of last FOMC Meeting                                                  |
|  59 | d_menu_adj_m050           | Policy menu dummy in 25% increments in range [-.50,.50]                             |
|  60 | d_menu_adj_m025           | Policy menu dummy in 25% increments in range [-.50,.50]                             |
|  61 | d_menu_adj_0              | Policy menu dummy in 25% increments in range [-.50,.50]                             |
|  62 | d_menu_adj_025            | Policy menu dummy in 25% increments in range [-.50,.50]                             |
|  63 | d_menu_adj_050            | Policy menu dummy in 25% increments in range [-.50,.50]                             |
|  67 | d_sample1                 | Dummy for meetings in range of 07-1989:07-2005                                      |
|  68 | d_sample2                 | Dummy for meetings in range of 07-1989:07-2005                                      |
|  69 | target_change_adj         | Target change in increments of 0.25                                                 |
|  70 | d_y2k                     | Dummy for the change of century in 2000                                             |
|  71 | l1_inflation              | Inflation variable lagged 1 month                                                   |
|  72 | l2_inflation              | Inflation variable lagged 2 months                                                  |
|  73 | diff_unemp                | Difference in unemployment between current month and previous month                 |
|  74 | l1_diff_unemp             | Difference in unemployment between current month and previous month lagged 2 months |
|  75 | l2_diff_unemp             | Difference in unemployment between current month and previous month lagged 2 months |
|  76 | ld_inflation              | Inflation calculated using log difference of pcepi                                  |
|  77 | l1_ld_inflation           | Inflation calculated using log difference of pcepi lagged 1 month                   |
|  78 | l2_ld_inflation           | Inflation calculated using log difference of pcepi lagged 2 months                  |
|  79 | l1_target_change          | Target change lagged 1 month                                                        |
|  80 | l2_target_change          | Target change lagged 2 months                                                       |
|  81 | l3_target_change          | Target change lagged 3 months                                                       |
|  82 | l4_target_change          | Target change lagged 4 months                                                       |
|  83 | l5_target_change          | Target change lagged 5 months                                                       |
|  84 | Fl1_target_change         | Target change multiplied by meeting dummy                                           |
|  85 | d_policy_m050             | Dummy for policy outcome                                                            |
|  86 | d_policy_m025             | Dummy for policy outcome                                                            |
|  87 | d_policy_0                | Dummy for policy outcome                                                            |
|  88 | d_policy_025              | Dummy for policy outcome                                                            |
|  89 | d_policy_050              | Dummy for policy outcome                                                            |
|  90 | d_policy_inc              | Dummy for policy outcome                                                            |
|  91 | d_policy_unc              | Dummy for policy outcome                                                            |
|  92 | d_policy_dec              | Dummy for policy outcome                                                            |
|  93 | INDPRO_g_1                | Future industrial production by g_* months in the future                            |
|  94 | INDPRO_g_2                | Future industrial production by g_* months in the future                            |
|  95 | INDPRO_g_3                | Future industrial production by g_* months in the future                            |
|  96 | INDPRO_g_4                | Future industrial production by g_* months in the future                            |
|  97 | INDPRO_g_5                | Future industrial production by g_* months in the future                            |
|  98 | INDPRO_g_6                | Future industrial production by g_* months in the future                            |
|  99 | INDPRO_g_7                | Future industrial production by g_* months in the future                            |
| 100 | INDPRO_g_8                | Future industrial production by g_* months in the future                            |
| 101 | INDPRO_g_9                | Future industrial production by g_* months in the future                            |
| 102 | INDPRO_g_10               | Future industrial production by g_* months in the future                            |
| 103 | INDPRO_g_11               | Future industrial production by g_* months in the future                            |
| 104 | INDPRO_g_12               | Future industrial production by g_* months in the future                            |
| 105 | INDPRO_g_13               | Future industrial production by g_* months in the future                            |
| 106 | INDPRO_g_14               | Future industrial production by g_* months in the future                            |
| 107 | INDPRO_g_15               | Future industrial production by g_* months in the future                            |
| 108 | INDPRO_g_16               | Future industrial production by g_* months in the future                            |
| 109 | INDPRO_g_17               | Future industrial production by g_* months in the future                            |
| 110 | INDPRO_g_18               | Future industrial production by g_* months in the future                            |
| 111 | INDPRO_g_19               | Future industrial production by g_* months in the future                            |
| 112 | INDPRO_g_20               | Future industrial production by g_* months in the future                            |
| 113 | INDPRO_g_21               | Future industrial production by g_* months in the future                            |
| 114 | INDPRO_g_22               | Future industrial production by g_* months in the future                            |
| 115 | INDPRO_g_23               | Future industrial production by g_* months in the future                            |
| 116 | INDPRO_g_24               | Future industrial production by g_* months in the future                            |
| 117 | PCEPI_g_1                 | Future PCEPI g_* months in the future                                               |
| 118 | PCEPI_g_2                 | Future PCEPI g_* months in the future                                               |
| 119 | PCEPI_g_3                 | Future PCEPI g_* months in the future                                               |
| 120 | PCEPI_g_4                 | Future PCEPI g_* months in the future                                               |
| 121 | PCEPI_g_5                 | Future PCEPI g_* months in the future                                               |
| 122 | PCEPI_g_6                 | Future PCEPI g_* months in the future                                               |
| 123 | PCEPI_g_7                 | Future PCEPI g_* months in the future                                               |
| 124 | PCEPI_g_8                 | Future PCEPI g_* months in the future                                               |
| 125 | PCEPI_g_9                 | Future PCEPI g_* months in the future                                               |
| 126 | PCEPI_g_10                | Future PCEPI g_* months in the future                                               |
| 127 | PCEPI_g_11                | Future PCEPI g_* months in the future                                               |
| 128 | PCEPI_g_12                | Future PCEPI g_* months in the future                                               |
| 129 | PCEPI_g_13                | Future PCEPI g_* months in the future                                               |
| 130 | PCEPI_g_14                | Future PCEPI g_* months in the future                                               |
| 131 | PCEPI_g_15                | Future PCEPI g_* months in the future                                               |
| 132 | PCEPI_g_16                | Future PCEPI g_* months in the future                                               |
| 133 | PCEPI_g_17                | Future PCEPI g_* months in the future                                               |
| 134 | PCEPI_g_18                | Future PCEPI g_* months in the future                                               |
| 135 | PCEPI_g_19                | Future PCEPI g_* months in the future                                               |
| 136 | PCEPI_g_20                | Future PCEPI g_* months in the future                                               |
| 137 | PCEPI_g_21                | Future PCEPI g_* months in the future                                               |
| 138 | PCEPI_g_22                | Future PCEPI g_* months in the future                                               |
| 139 | PCEPI_g_23                | Future PCEPI g_* months in the future                                               |
| 140 | PCEPI_g_24                | Future PCEPI g_* months in the future                                               |
| 141 | unemp_g_1                 | Future Unemployment g_* months in the future                                        |
| 142 | unemp_g_2                 | Future Unemployment g_* months in the future                                        |
| 143 | unemp_g_3                 | Future Unemployment g_* months in the future                                        |
| 144 | unemp_g_4                 | Future Unemployment g_* months in the future                                        |
| 145 | unemp_g_5                 | Future Unemployment g_* months in the future                                        |
| 146 | unemp_g_6                 | Future Unemployment g_* months in the future                                        |
| 147 | unemp_g_7                 | Future Unemployment g_* months in the future                                        |
| 148 | unemp_g_8                 | Future Unemployment g_* months in the future                                        |
| 149 | unemp_g_9                 | Future Unemployment g_* months in the future                                        |
| 150 | unemp_g_10                | Future Unemployment g_* months in the future                                        |
| 151 | unemp_g_11                | Future Unemployment g_* months in the future                                        |
| 152 | unemp_g_12                | Future Unemployment g_* months in the future                                        |
| 153 | unemp_g_13                | Future Unemployment g_* months in the future                                        |
| 154 | unemp_g_14                | Future Unemployment g_* months in the future                                        |
| 155 | unemp_g_15                | Future Unemployment g_* months in the future                                        |
| 156 | unemp_g_16                | Future Unemployment g_* months in the future                                        |
| 157 | unemp_g_17                | Future Unemployment g_* months in the future                                        |
| 158 | unemp_g_18                | Future Unemployment g_* months in the future                                        |
| 159 | unemp_g_19                | Future Unemployment g_* months in the future                                        |
| 160 | unemp_g_20                | Future Unemployment g_* months in the future                                        |
| 161 | unemp_g_21                | Future Unemployment g_* months in the future                                        |
| 162 | unemp_g_22                | Future Unemployment g_* months in the future                                        |
| 163 | unemp_g_23                | Future Unemployment g_* months in the future                                        |
| 164 | unemp_g_24                | Future Unemployment g_* months in the future                                        |
| 165 | TRY_3M_g_1                | Future three month maturity treasury securities g_* months in the future            |
| 166 | TRY_3M_g_2                | Future three month maturity treasury securities g_* months in the future            |
| 167 | TRY_3M_g_3                | Future three month maturity treasury securities g_* months in the future            |
| 168 | TRY_3M_g_4                | Future three month maturity treasury securities g_* months in the future            |
| 169 | TRY_3M_g_5                | Future three month maturity treasury securities g_* months in the future            |
| 170 | TRY_3M_g_6                | Future three month maturity treasury securities g_* months in the future            |
| 171 | TRY_3M_g_7                | Future three month maturity treasury securities g_* months in the future            |
| 172 | TRY_3M_g_8                | Future three month maturity treasury securities g_* months in the future            |
| 173 | TRY_3M_g_9                | Future three month maturity treasury securities g_* months in the future            |
| 174 | TRY_3M_g_10               | Future three month maturity treasury securities g_* months in the future            |
| 175 | TRY_3M_g_11               | Future three month maturity treasury securities g_* months in the future            |
| 176 | TRY_3M_g_12               | Future three month maturity treasury securities g_* months in the future            |
| 177 | TRY_3M_g_13               | Future three month maturity treasury securities g_* months in the future            |
| 178 | TRY_3M_g_14               | Future three month maturity treasury securities g_* months in the future            |
| 179 | TRY_3M_g_15               | Future three month maturity treasury securities g_* months in the future            |
| 180 | TRY_3M_g_16               | Future three month maturity treasury securities g_* months in the future            |
| 181 | TRY_3M_g_17               | Future three month maturity treasury securities g_* months in the future            |
| 182 | TRY_3M_g_18               | Future three month maturity treasury securities g_* months in the future            |
| 183 | TRY_3M_g_19               | Future three month maturity treasury securities g_* months in the future            |
| 184 | TRY_3M_g_20               | Future three month maturity treasury securities g_* months in the future            |
| 185 | TRY_3M_g_21               | Future three month maturity treasury securities g_* months in the future            |
| 186 | TRY_3M_g_22               | Future three month maturity treasury securities g_* months in the future            |
| 187 | TRY_3M_g_23               | Future three month maturity treasury securities g_* months in the future            |
| 188 | TRY_3M_g_24               | Future three month maturity treasury securities g_* months in the future            |
| 189 | TRY_2Y_g_1                | Future two year maturity treasury securities g_* months in the future               |
| 190 | TRY_2Y_g_2                | Future two year maturity treasury securities g_* months in the future               |
| 191 | TRY_2Y_g_3                | Future two year maturity treasury securities g_* months in the future               |
| 192 | TRY_2Y_g_4                | Future two year maturity treasury securities g_* months in the future               |
| 193 | TRY_2Y_g_5                | Future two year maturity treasury securities g_* months in the future               |
| 194 | TRY_2Y_g_6                | Future two year maturity treasury securities g_* months in the future               |
| 195 | TRY_2Y_g_7                | Future two year maturity treasury securities g_* months in the future               |
| 196 | TRY_2Y_g_8                | Future two year maturity treasury securities g_* months in the future               |
| 197 | TRY_2Y_g_9                | Future two year maturity treasury securities g_* months in the future               |
| 198 | TRY_2Y_g_10               | Future two year maturity treasury securities g_* months in the future               |
| 199 | TRY_2Y_g_11               | Future two year maturity treasury securities g_* months in the future               |
| 200 | TRY_2Y_g_12               | Future two year maturity treasury securities g_* months in the future               |
| 201 | TRY_2Y_g_13               | Future two year maturity treasury securities g_* months in the future               |
| 202 | TRY_2Y_g_14               | Future two year maturity treasury securities g_* months in the future               |
| 203 | TRY_2Y_g_15               | Future two year maturity treasury securities g_* months in the future               |
| 204 | TRY_2Y_g_16               | Future two year maturity treasury securities g_* months in the future               |
| 205 | TRY_2Y_g_17               | Future two year maturity treasury securities g_* months in the future               |
| 206 | TRY_2Y_g_18               | Future two year maturity treasury securities g_* months in the future               |
| 207 | TRY_2Y_g_19               | Future two year maturity treasury securities g_* months in the future               |
| 208 | TRY_2Y_g_20               | Future two year maturity treasury securities g_* months in the future               |
| 209 | TRY_2Y_g_21               | Future two year maturity treasury securities g_* months in the future               |
| 210 | TRY_2Y_g_22               | Future two year maturity treasury securities g_* months in the future               |
| 211 | TRY_2Y_g_23               | Future two year maturity treasury securities g_* months in the future               |
| 212 | TRY_2Y_g_24               | Future two year maturity treasury securities g_* months in the future               |
| 213 | TRY_10Y_g_1               | Future ten year maturity treasury securities g_* months in the future               |
| 214 | TRY_10Y_g_2               | Future ten year maturity treasury securities g_* months in the future               |
| 215 | TRY_10Y_g_3               | Future ten year maturity treasury securities g_* months in the future               |
| 216 | TRY_10Y_g_4               | Future ten year maturity treasury securities g_* months in the future               |
| 217 | TRY_10Y_g_5               | Future ten year maturity treasury securities g_* months in the future               |
| 218 | TRY_10Y_g_6               | Future ten year maturity treasury securities g_* months in the future               |
| 219 | TRY_10Y_g_7               | Future ten year maturity treasury securities g_* months in the future               |
| 220 | TRY_10Y_g_8               | Future ten year maturity treasury securities g_* months in the future               |
| 221 | TRY_10Y_g_9               | Future ten year maturity treasury securities g_* months in the future               |
| 222 | TRY_10Y_g_10              | Future ten year maturity treasury securities g_* months in the future               |
| 223 | TRY_10Y_g_11              | Future ten year maturity treasury securities g_* months in the future               |
| 224 | TRY_10Y_g_12              | Future ten year maturity treasury securities g_* months in the future               |
| 225 | TRY_10Y_g_13              | Future ten year maturity treasury securities g_* months in the future               |
| 226 | TRY_10Y_g_14              | Future ten year maturity treasury securities g_* months in the future               |
| 227 | TRY_10Y_g_15              | Future ten year maturity treasury securities g_* months in the future               |
| 228 | TRY_10Y_g_16              | Future ten year maturity treasury securities g_* months in the future               |
| 229 | TRY_10Y_g_17              | Future ten year maturity treasury securities g_* months in the future               |
| 230 | TRY_10Y_g_18              | Future ten year maturity treasury securities g_* months in the future               |
| 231 | TRY_10Y_g_19              | Future ten year maturity treasury securities g_* months in the future               |
| 232 | TRY_10Y_g_20              | Future ten year maturity treasury securities g_* months in the future               |
| 233 | TRY_10Y_g_21              | Future ten year maturity treasury securities g_* months in the future               |
| 234 | TRY_10Y_g_22              | Future ten year maturity treasury securities g_* months in the future               |
| 235 | TRY_10Y_g_23              | Future ten year maturity treasury securities g_* months in the future               |
| 236 | TRY_10Y_g_24              | Future ten year maturity treasury securities g_* months in the future               |
| 237 | FF_TAR_g_1                | Future federal funds target rate g_* months in the future                           |
| 238 | FF_TAR_g_2                | Future federal funds target rate g_* months in the future                           |
| 239 | FF_TAR_g_3                | Future federal funds target rate g_* months in the future                           |
| 240 | FF_TAR_g_4                | Future federal funds target rate g_* months in the future                           |
| 241 | FF_TAR_g_5                | Future federal funds target rate g_* months in the future                           |
| 242 | FF_TAR_g_6                | Future federal funds target rate g_* months in the future                           |
| 243 | FF_TAR_g_7                | Future federal funds target rate g_* months in the future                           |
| 244 | FF_TAR_g_8                | Future federal funds target rate g_* months in the future                           |
| 245 | FF_TAR_g_9                | Future federal funds target rate g_* months in the future                           |
| 246 | FF_TAR_g_10               | Future federal funds target rate g_* months in the future                           |
| 247 | FF_TAR_g_11               | Future federal funds target rate g_* months in the future                           |
| 248 | FF_TAR_g_12               | Future federal funds target rate g_* months in the future                           |
| 249 | FF_TAR_g_13               | Future federal funds target rate g_* months in the future                           |
| 250 | FF_TAR_g_14               | Future federal funds target rate g_* months in the future                           |
| 251 | FF_TAR_g_15               | Future federal funds target rate g_* months in the future                           |
| 252 | FF_TAR_g_16               | Future federal funds target rate g_* months in the future                           |
| 253 | FF_TAR_g_17               | Future federal funds target rate g_* months in the future                           |
| 254 | FF_TAR_g_18               | Future federal funds target rate g_* months in the future                           |
| 255 | FF_TAR_g_19               | Future federal funds target rate g_* months in the future                           |
| 256 | FF_TAR_g_20               | Future federal funds target rate g_* months in the future                           |
| 257 | FF_TAR_g_21               | Future federal funds target rate g_* months in the future                           |
| 258 | FF_TAR_g_22               | Future federal funds target rate g_* months in the future                           |
| 259 | FF_TAR_g_23               | Future federal funds target rate g_* months in the future                           |
| 260 | FF_TAR_g_24               | Future federal funds target rate g_* months in the future                           |
| 268 | yearly_inflation_change   | Inflation changed calculated on the yearly level                                    |
| 269 | l1_diff_unemp_yearly      | l1 difference in unemployment calculated yearly                                     |
| 270 | l1_diff_unemp_quarterly   | l1 difference in unemployment calculated quarterly                                  |
| 271 | ld_inflation_yearly       | Inflation[calculated via log difference] calculated yearly                          |
| 272 | ld_inflation_quarterly    | Inflation[calculated via log difference] calculated quarterly                       |
| 273 | l1_ld_inflation_yearly    | Lagged Inflation[calculated via log difference] calculated yearly                   |
| 274 | l1_ld_inflation_quarterly | Lagged Inflation[calculated via log difference] calculated quarterly                |
| 275 | etu_outcome               | Sign of target change, or 0 if unchanged                                            |
| 268 | yearly_inflation_change   | Inflation changed calculated on the yearly level                                    |
| 269 | l1_diff_unemp_yearly      | l1 difference in unemployment calculated yearly                                     |
| 270 | l1_diff_unemp_quarterly   | l1 difference in unemployment calculated quarterly                                  |
| 271 | ld_inflation_yearly       | Inflation[calculated via log difference] calculated yearly                          |
| 272 | ld_inflation_quarterly    | Inflation[calculated via log difference] calculated quarterly                       |
| 273 | l1_ld_inflation_yearly    | Lagged Inflation[calculated via log difference] calculated yearly                   |
| 274 | l1_ld_inflation_quarterly | Lagged Inflation[calculated via log difference] calculated quarterly                |
| 275 | etu_outcome               | Sign of target change, or 0 if unchanged                                            |
