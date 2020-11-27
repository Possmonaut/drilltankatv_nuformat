
for(var i = 1; i < 5; i++)
{
	instance_destroy(segArray[i]);
}

instance_destroy(rArm);
instance_destroy(lArm);

//ds_list_clear(segArray);
//ds_list_destroy(segArray); //why isn't this working? 