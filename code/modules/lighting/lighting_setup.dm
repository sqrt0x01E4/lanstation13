/proc/create_all_lighting_overlays()
	for (var/zlevel = 1 to world.maxz)
		create_lighting_overlays_zlevel(zlevel)

/proc/create_lighting_overlays_zlevel(var/zlevel)
	ASSERT(zlevel)

	for (var/turf/T in block(locate(1, 1, zlevel), locate(world.maxx, world.maxy, zlevel)))
		if (!T.lighting_use_dynamic)
			continue

		var/area/A = T.loc
		if (!A.lighting_use_dynamic)
			continue

		getFromPool(/atom/movable/lighting_overlay, T, TRUE)
