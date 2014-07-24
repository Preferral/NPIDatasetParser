module DataProcessing
	class RowObjectBuilder
		attr_accessor :object

		def initialize(row)
			@values = row
		end

		def objectify
			if entity_type == 'Individual'
				@object = create_individual_provider
			elsif entity_type == 'Organization'
				@object = create_organization_provider
			else
				raise 'Invalid Data'
			end
		end

		private

		def entity_type
			entity_types = {
				'1' => 'Individual',
				'2' => 'Organization'
			}
			entity_types[@values[1]]
		end

		def create_individual_provider
			Providers::Individual.create({
				npi: @values[0],
				replacement_npi: @values[2],
				ein: @values[3],
				last_name: @values[5],
				first_name: @values[6],
				middle_name: @values[7],
				name_prefix: @values[8],
				name_suffix: @values[9],
				provider_credential: @values[10],
				other_last_name: @values[13],
				other_first_name: @values[14],
				other_middle_name: @values[15],
				other_name_prefix: @values[16],
				other_name_suffix: @values[17],
				other_provider_credential: @values[18],
				other_last_name_type_code: @values[19]
			})
		end

		def create_organization_provider
			# ...
		end
	end
end

# 0    -->  "NPI",
# 1    -->  "Entity Type Code",
# 2    -->  "Replacement NPI",
# 3    -->  "Employer Identification Number (EIN)",
# 4    -->  "Provider Organization Name (Legal Business Name)",
# 5    -->  "Provider Last Name (Legal Name)",
# 6    -->  "Provider First Name",
# 7    -->  "Provider Middle Name",
# 8    -->  "Provider Name Prefix Text",
# 9    -->  "Provider Name Suffix Text",
# 10   -->  "Provider Credential Text",
# 11   -->  "Provider Other Organization Name",
# 12   -->  "Provider Other Organization Name Type Code",
# 13   -->  "Provider Other Last Name",
# 14   -->  "Provider Other First Name",
# 15   -->  "Provider Other Middle Name",
# 16   -->  "Provider Other Name Prefix Text",
# 17   -->  "Provider Other Name Suffix Text",
# 18   -->  "Provider Other Credential Text",
# 19   -->  "Provider Other Last Name Type Code",
# 20   -->  "Provider First Line Business Mailing Address",
# 21   -->  "Provider Second Line Business Mailing Address",
# 22   -->  "Provider Business Mailing Address City Name",
# 23   -->  "Provider Business Mailing Address State Name",
# 24   -->  "Provider Business Mailing Address Postal Code",
# 25   -->  "Provider Business Mailing Address Country Code (If outside U.S.)",
# 26   -->  "Provider Business Mailing Address Telephone Number",
# 27   -->  "Provider Business Mailing Address Fax Number",
# 28   -->  "Provider First Line Business Practice Location Address",
# 29   -->  "Provider Second Line Business Practice Location Address",
# 30   -->  "Provider Business Practice Location Address City Name",
# 31   -->  "Provider Business Practice Location Address State Name",
# 32   -->  "Provider Business Practice Location Address Postal Code",
# 33   -->  "Provider Business Practice Location Address Country Code (If outside U.S.)",
# 34   -->  "Provider Business Practice Location Address Telephone Number",
# 35   -->  "Provider Business Practice Location Address Fax Number",
# 36   -->  "Provider Enumeration Date",
# 37   -->  "Last Update Date",
# 38   -->  "NPI Deactivation Reason Code",
# 39   -->  "NPI Deactivation Date",
# 40   -->  "NPI Reactivation Date",
# 41   -->  "Provider Gender Code",
# 42   -->  "Authorized Official Last Name",
# 43   -->  "Authorized Official First Name",
# 44   -->  "Authorized Official Middle Name",
# 45   -->  "Authorized Official Title or Position",
# 46   -->  "Authorized Official Telephone Number",
# 47   -->  "Healthcare Provider Taxonomy Code_1",
# 48   -->  "Provider License Number_1",
# 49   -->  "Provider License Number State Code_1",
# 50   -->  "Healthcare Provider Primary Taxonomy Switch_1",
# 51   -->  "Healthcare Provider Taxonomy Code_2",
# 52   -->  "Provider License Number_2",
# 53   -->  "Provider License Number State Code_2",
# 54   -->  "Healthcare Provider Primary Taxonomy Switch_2",
# 55   -->  "Healthcare Provider Taxonomy Code_3",
# 56   -->  "Provider License Number_3",
# 57   -->  "Provider License Number State Code_3",
# 58   -->  "Healthcare Provider Primary Taxonomy Switch_3",
# 59   -->  "Healthcare Provider Taxonomy Code_4",
# 60   -->  "Provider License Number_4",
# 61   -->  "Provider License Number State Code_4",
# 62   -->  "Healthcare Provider Primary Taxonomy Switch_4",
# 63   -->  "Healthcare Provider Taxonomy Code_5",
# 64   -->  "Provider License Number_5",
# 65   -->  "Provider License Number State Code_5",
# 66   -->  "Healthcare Provider Primary Taxonomy Switch_5",
# 67   -->  "Healthcare Provider Taxonomy Code_6",
# 68   -->  "Provider License Number_6",
# 69   -->  "Provider License Number State Code_6",
# 70   -->  "Healthcare Provider Primary Taxonomy Switch_6",
# 71   -->  "Healthcare Provider Taxonomy Code_7",
# 72   -->  "Provider License Number_7",
# 73   -->  "Provider License Number State Code_7",
# 74   -->  "Healthcare Provider Primary Taxonomy Switch_7",
# 75   -->  "Healthcare Provider Taxonomy Code_8",
# 76   -->  "Provider License Number_8",
# 77   -->  "Provider License Number State Code_8",
# 78   -->  "Healthcare Provider Primary Taxonomy Switch_8",
# 79   -->  "Healthcare Provider Taxonomy Code_9",
# 80   -->  "Provider License Number_9",
# 81   -->  "Provider License Number State Code_9",
# 82   -->  "Healthcare Provider Primary Taxonomy Switch_9",
# 83   -->  "Healthcare Provider Taxonomy Code_10",
# 84   -->  "Provider License Number_10",
# 85   -->  "Provider License Number State Code_10",
# 86   -->  "Healthcare Provider Primary Taxonomy Switch_10",
# 87   -->  "Healthcare Provider Taxonomy Code_11",
# 88   -->  "Provider License Number_11",
# 89   -->  "Provider License Number State Code_11",
# 90   -->  "Healthcare Provider Primary Taxonomy Switch_11",
# 91   -->  "Healthcare Provider Taxonomy Code_12",
# 92   -->  "Provider License Number_12",
# 93   -->  "Provider License Number State Code_12",
# 94   -->  "Healthcare Provider Primary Taxonomy Switch_12",
# 95   -->  "Healthcare Provider Taxonomy Code_13",
# 96   -->  "Provider License Number_13",
# 97   -->  "Provider License Number State Code_13",
# 98   -->  "Healthcare Provider Primary Taxonomy Switch_13",
# 99   -->  "Healthcare Provider Taxonomy Code_14",
# 100  -->  "Provider License Number_14",
# 101  -->  "Provider License Number State Code_14",
# 102  -->  "Healthcare Provider Primary Taxonomy Switch_14",
# 103  -->  "Healthcare Provider Taxonomy Code_15",
# 104  -->  "Provider License Number_15",
# 105  -->  "Provider License Number State Code_15",
# 106  -->  "Healthcare Provider Primary Taxonomy Switch_15",
# 107  -->  "Other Provider Identifier_1",
# 108  -->  "Other Provider Identifier Type Code_1",
# 109  -->  "Other Provider Identifier State_1",
# 110  -->  "Other Provider Identifier Issuer_1",
# 111  -->  "Other Provider Identifier_2",
# 112  -->  "Other Provider Identifier Type Code_2",
# 113  -->  "Other Provider Identifier State_2",
# 114  -->  "Other Provider Identifier Issuer_2",
# 115  -->  "Other Provider Identifier_3",
# 116  -->  "Other Provider Identifier Type Code_3",
# 117  -->  "Other Provider Identifier State_3",
# 118  -->  "Other Provider Identifier Issuer_3",
# 119  -->  "Other Provider Identifier_4",
# 120  -->  "Other Provider Identifier Type Code_4",
# 121  -->  "Other Provider Identifier State_4",
# 122  -->  "Other Provider Identifier Issuer_4",
# 123  -->  "Other Provider Identifier_5",
# 124  -->  "Other Provider Identifier Type Code_5",
# 125  -->  "Other Provider Identifier State_5",
# 126  -->  "Other Provider Identifier Issuer_5",
# 127  -->  "Other Provider Identifier_6",
# 128  -->  "Other Provider Identifier Type Code_6",
# 129  -->  "Other Provider Identifier State_6",
# 130  -->  "Other Provider Identifier Issuer_6",
# 131  -->  "Other Provider Identifier_7",
# 132  -->  "Other Provider Identifier Type Code_7",
# 133  -->  "Other Provider Identifier State_7",
# 134  -->  "Other Provider Identifier Issuer_7",
# 135  -->  "Other Provider Identifier_8",
# 136  -->  "Other Provider Identifier Type Code_8",
# 137  -->  "Other Provider Identifier State_8",
# 138  -->  "Other Provider Identifier Issuer_8",
# 139  -->  "Other Provider Identifier_9",
# 140  -->  "Other Provider Identifier Type Code_9",
# 141  -->  "Other Provider Identifier State_9",
# 142  -->  "Other Provider Identifier Issuer_9",
# 143  -->  "Other Provider Identifier_10",
# 144  -->  "Other Provider Identifier Type Code_10",
# 145  -->  "Other Provider Identifier State_10",
# 146  -->  "Other Provider Identifier Issuer_10",
# 147  -->  "Other Provider Identifier_11",
# 148  -->  "Other Provider Identifier Type Code_11",
# 149  -->  "Other Provider Identifier State_11",
# 150  -->  "Other Provider Identifier Issuer_11",
# 151  -->  "Other Provider Identifier_12",
# 152  -->  "Other Provider Identifier Type Code_12",
# 153  -->  "Other Provider Identifier State_12",
# 154  -->  "Other Provider Identifier Issuer_12",
# 155  -->  "Other Provider Identifier_13",
# 156  -->  "Other Provider Identifier Type Code_13",
# 157  -->  "Other Provider Identifier State_13",
# 158  -->  "Other Provider Identifier Issuer_13",
# 159  -->  "Other Provider Identifier_14",
# 160  -->  "Other Provider Identifier Type Code_14",
# 161  -->  "Other Provider Identifier State_14",
# 162  -->  "Other Provider Identifier Issuer_14",
# 163  -->  "Other Provider Identifier_15",
# 164  -->  "Other Provider Identifier Type Code_15",
# 165  -->  "Other Provider Identifier State_15",
# 166  -->  "Other Provider Identifier Issuer_15",
# 167  -->  "Other Provider Identifier_16",
# 168  -->  "Other Provider Identifier Type Code_16",
# 169  -->  "Other Provider Identifier State_16",
# 170  -->  "Other Provider Identifier Issuer_16",
# 171  -->  "Other Provider Identifier_17",
# 172  -->  "Other Provider Identifier Type Code_17",
# 173  -->  "Other Provider Identifier State_17",
# 174  -->  "Other Provider Identifier Issuer_17",
# 175  -->  "Other Provider Identifier_18",
# 176  -->  "Other Provider Identifier Type Code_18",
# 177  -->  "Other Provider Identifier State_18",
# 178  -->  "Other Provider Identifier Issuer_18",
# 179  -->  "Other Provider Identifier_19",
# 180  -->  "Other Provider Identifier Type Code_19",
# 181  -->  "Other Provider Identifier State_19",
# 182  -->  "Other Provider Identifier Issuer_19",
# 183  -->  "Other Provider Identifier_20",
# 184  -->  "Other Provider Identifier Type Code_20",
# 185  -->  "Other Provider Identifier State_20",
# 186  -->  "Other Provider Identifier Issuer_20",
# 187  -->  "Other Provider Identifier_21",
# 188  -->  "Other Provider Identifier Type Code_21",
# 189  -->  "Other Provider Identifier State_21",
# 190  -->  "Other Provider Identifier Issuer_21",
# 191  -->  "Other Provider Identifier_22",
# 192  -->  "Other Provider Identifier Type Code_22",
# 193  -->  "Other Provider Identifier State_22",
# 194  -->  "Other Provider Identifier Issuer_22",
# 195  -->  "Other Provider Identifier_23",
# 196  -->  "Other Provider Identifier Type Code_23",
# 197  -->  "Other Provider Identifier State_23",
# 198  -->  "Other Provider Identifier Issuer_23",
# 199  -->  "Other Provider Identifier_24",
# 200  -->  "Other Provider Identifier Type Code_24",
# 201  -->  "Other Provider Identifier State_24",
# 202  -->  "Other Provider Identifier Issuer_24",
# 203  -->  "Other Provider Identifier_25",
# 204  -->  "Other Provider Identifier Type Code_25",
# 205  -->  "Other Provider Identifier State_25",
# 206  -->  "Other Provider Identifier Issuer_25",
# 207  -->  "Other Provider Identifier_26",
# 208  -->  "Other Provider Identifier Type Code_26",
# 209  -->  "Other Provider Identifier State_26",
# 210  -->  "Other Provider Identifier Issuer_26",
# 211  -->  "Other Provider Identifier_27",
# 212  -->  "Other Provider Identifier Type Code_27",
# 213  -->  "Other Provider Identifier State_27",
# 214  -->  "Other Provider Identifier Issuer_27",
# 215  -->  "Other Provider Identifier_28",
# 216  -->  "Other Provider Identifier Type Code_28",
# 217  -->  "Other Provider Identifier State_28",
# 218  -->  "Other Provider Identifier Issuer_28",
# 219  -->  "Other Provider Identifier_29",
# 220  -->  "Other Provider Identifier Type Code_29",
# 221  -->  "Other Provider Identifier State_29",
# 222  -->  "Other Provider Identifier Issuer_29",
# 223  -->  "Other Provider Identifier_30",
# 224  -->  "Other Provider Identifier Type Code_30",
# 225  -->  "Other Provider Identifier State_30",
# 226  -->  "Other Provider Identifier Issuer_30",
# 227  -->  "Other Provider Identifier_31",
# 228  -->  "Other Provider Identifier Type Code_31",
# 229  -->  "Other Provider Identifier State_31",
# 230  -->  "Other Provider Identifier Issuer_31",
# 231  -->  "Other Provider Identifier_32",
# 232  -->  "Other Provider Identifier Type Code_32",
# 233  -->  "Other Provider Identifier State_32",
# 234  -->  "Other Provider Identifier Issuer_32",
# 235  -->  "Other Provider Identifier_33",
# 236  -->  "Other Provider Identifier Type Code_33",
# 237  -->  "Other Provider Identifier State_33",
# 238  -->  "Other Provider Identifier Issuer_33",
# 239  -->  "Other Provider Identifier_34",
# 240  -->  "Other Provider Identifier Type Code_34",
# 241  -->  "Other Provider Identifier State_34",
# 242  -->  "Other Provider Identifier Issuer_34",
# 243  -->  "Other Provider Identifier_35",
# 244  -->  "Other Provider Identifier Type Code_35",
# 245  -->  "Other Provider Identifier State_35",
# 246  -->  "Other Provider Identifier Issuer_35",
# 247  -->  "Other Provider Identifier_36",
# 248  -->  "Other Provider Identifier Type Code_36",
# 249  -->  "Other Provider Identifier State_36",
# 250  -->  "Other Provider Identifier Issuer_36",
# 251  -->  "Other Provider Identifier_37",
# 252  -->  "Other Provider Identifier Type Code_37",
# 253  -->  "Other Provider Identifier State_37",
# 254  -->  "Other Provider Identifier Issuer_37",
# 255  -->  "Other Provider Identifier_38",
# 256  -->  "Other Provider Identifier Type Code_38",
# 257  -->  "Other Provider Identifier State_38",
# 258  -->  "Other Provider Identifier Issuer_38",
# 259  -->  "Other Provider Identifier_39",
# 260  -->  "Other Provider Identifier Type Code_39",
# 261  -->  "Other Provider Identifier State_39",
# 262  -->  "Other Provider Identifier Issuer_39",
# 263  -->  "Other Provider Identifier_40",
# 264  -->  "Other Provider Identifier Type Code_40",
# 265  -->  "Other Provider Identifier State_40",
# 266  -->  "Other Provider Identifier Issuer_40",
# 267  -->  "Other Provider Identifier_41",
# 268  -->  "Other Provider Identifier Type Code_41",
# 269  -->  "Other Provider Identifier State_41",
# 270  -->  "Other Provider Identifier Issuer_41",
# 271  -->  "Other Provider Identifier_42",
# 272  -->  "Other Provider Identifier Type Code_42",
# 273  -->  "Other Provider Identifier State_42",
# 274  -->  "Other Provider Identifier Issuer_42",
# 275  -->  "Other Provider Identifier_43",
# 276  -->  "Other Provider Identifier Type Code_43",
# 277  -->  "Other Provider Identifier State_43",
# 278  -->  "Other Provider Identifier Issuer_43",
# 279  -->  "Other Provider Identifier_44",
# 280  -->  "Other Provider Identifier Type Code_44",
# 281  -->  "Other Provider Identifier State_44",
# 282  -->  "Other Provider Identifier Issuer_44",
# 283  -->  "Other Provider Identifier_45",
# 284  -->  "Other Provider Identifier Type Code_45",
# 285  -->  "Other Provider Identifier State_45",
# 286  -->  "Other Provider Identifier Issuer_45",
# 287  -->  "Other Provider Identifier_46",
# 288  -->  "Other Provider Identifier Type Code_46",
# 289  -->  "Other Provider Identifier State_46",
# 290  -->  "Other Provider Identifier Issuer_46",
# 291  -->  "Other Provider Identifier_47",
# 292  -->  "Other Provider Identifier Type Code_47",
# 293  -->  "Other Provider Identifier State_47",
# 294  -->  "Other Provider Identifier Issuer_47",
# 295  -->  "Other Provider Identifier_48",
# 296  -->  "Other Provider Identifier Type Code_48",
# 297  -->  "Other Provider Identifier State_48",
# 298  -->  "Other Provider Identifier Issuer_48",
# 299  -->  "Other Provider Identifier_49",
# 300  -->  "Other Provider Identifier Type Code_49",
# 301  -->  "Other Provider Identifier State_49",
# 302  -->  "Other Provider Identifier Issuer_49",
# 303  -->  "Other Provider Identifier_50",
# 304  -->  "Other Provider Identifier Type Code_50",
# 305  -->  "Other Provider Identifier State_50",
# 306  -->  "Other Provider Identifier Issuer_50",
# 307  -->  "Is Sole Proprietor",
# 308  -->  "Is Organization Subpart",
# 309  -->  "Parent Organization LBN",
# 310  -->  "Parent Organization TIN",
# 311  -->  "Authorized Official Name Prefix Text",
# 312  -->  "Authorized Official Name Suffix Text",
# 313  -->  "Authorized Official Credential Text",
# 314  -->  "Healthcare Provider Taxonomy Group_1",
# 315  -->  "Healthcare Provider Taxonomy Group_2",
# 316  -->  "Healthcare Provider Taxonomy Group_3",
# 317  -->  "Healthcare Provider Taxonomy Group_4",
# 318  -->  "Healthcare Provider Taxonomy Group_5",
# 319  -->  "Healthcare Provider Taxonomy Group_6",
# 320  -->  "Healthcare Provider Taxonomy Group_7",
# 321  -->  "Healthcare Provider Taxonomy Group_8",
# 322  -->  "Healthcare Provider Taxonomy Group_9",
# 323  -->  "Healthcare Provider Taxonomy Group_10",
# 324  -->  "Healthcare Provider Taxonomy Group_11",
# 325  -->  "Healthcare Provider Taxonomy Group_12",
# 326  -->  "Healthcare Provider Taxonomy Group_13",
# 327  -->  "Healthcare Provider Taxonomy Group_14",
# 328  -->  "Healthcare Provider Taxonomy Group_15"
