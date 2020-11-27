
var cullingSize = ds_list_size(activeSources);

for(var i = 0; i < cullingSize; i++)
{
	if(!instance_exists(activeSources[|i]))
	{
		ds_list_delete(activeSources,i);
		ds_list_delete(activeSrcSprt,i);
		ds_list_delete(activeSourcesX,i);
		ds_list_delete(activeSourcesY,i);
		ds_list_delete(activeSourcesSize,i);
	}
}

var newSrcSize = ds_list_size(newSources);

if(newSrcSize > 0)
{
	for(var i = 0; i < newSrcSize; i++)
	{
	ds_list_add(activeSources, newSources[|i]);
	
	if(variable_instance_exists(newSources[|i],"lightSprite"))
	{
		ds_list_add(activeSrcSprt, newSources[|i].lightSprite);
	}
	else
	{
		ds_list_add(activeSrcSprt, newSources[|i].sprite_index);
	}
	
	ds_list_add(activeSourcesX, newSources[|i].x+newSources[|i].lightOffsetX);
	ds_list_add(activeSourcesY, newSources[|i].y+newSources[|i].lightOffsetY);
	ds_list_add(activeSourcesSize, newSources[|i].lightSize);
	}
	
	ds_list_clear(newSources);
}

