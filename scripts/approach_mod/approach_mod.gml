/// scr_approach(start, end, shift);
function approach_mod(argument0, argument1, argument2) {

	if(argument0 > argument1){
	    return max(argument0 + argument2, argument1); 
	}else{
	    return min(argument0 - argument2, argument1);
	}


}
