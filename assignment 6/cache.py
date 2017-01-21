import binascii
import math

L = 16
K = 1
N = 8
hits = 0
misses = 0
conflicts = 0
capacities = 0
compulsorys = 0
 
tags = [[0 for x in range(K)] for y in range(N)] 
#initialize this all to 0 so we can check for compulsory misses
addresses = ["0x0000", "0x0004", "0x000c", "0x2200", "0x00d0", "0x00e0", "0x1130", "0x0028", "0x113c", "0x2204", "0x0010", "0x0020", "0x0004", "0x0040", "0x2208", "0x0008", "0x00a0", "0x0004", "0x1104", "0x0028", "0x0064", "0x0070", "0x00d0", "0x0008", "0x3394"]	

cache =  [[[0 for z in range(4)] for x in range(K)] for y in range(N)] 
#initalize the tags to have some null value so we can check for compulsory misses
#define a tree structure for each set so we can pseudo-LRU
setTrees = [for y in range(N)]
for sets in N
	setTrees[sets] = Tree(tree=None, deep=False)
	for tags in K
		tagNode = Node([tags[, tags]])

		tagNode.update_bpointer()


for address in addresses:
	base_10_representation = int(address, 16)
	offset = base_10_representation & 15
	number_of_set_bits = int(math.log(N, 2.0)) 
	set_masks = {0:0, 1:16, 2:48, 3:112}
	tag_masks = {0:65520, 1:65504, 2:65472, 3:65408}
	set_number = base_10_representation & set_masks[number_of_set_bits]
	set_number = set_number >> 4 							#move the set number back down to actually make sense instead of being large power of 2
	tag = base_10_representation & tag_masks[number_of_set_bits]
	tag = tag >> 4 + number_of_set_bits
	stored = false
	#iterate thru tags in set, if the tag is there increment hits, update the pseudo-LRU tree
	for i in K:
		if tags[set_number][i] == tag # change to use tags array
			hits += 1
			stored = true
			#update tree
	if not stored		
		misses += 1
		#iterate thru tags in set, if there is empty space fill it and associated cahce space
		for i in K:
			if not tags[set_number][i]
				compulsorys += 1
				base_value = base_10_representation & 65520 #zero out the last hex digit of the address, then increment by 4 for each value stored
				tags[set_number][i] = tag
				for j in 4
					cache[set_number][i][j] = base_value
					base_value += 4
				stored = true	
				#update tree
			
				 	
	if not stored		
		#use tree to determine which tag to evict
		#is it a conflict of a capacity miss
		#update pseudo-LRU tree

#print out results