<h1 align="center">Performance FFlags</h1>
<h3 align="center">
This Github involves fast flags that help with performance, and delay (such as ping and input delay).


If there are fast flags that do not work, feel free to @ me on [Discord](https://discord.gg/CZUfHYHtZr).

Brought to you by Roblox Client Optimizer • Last Updated: `07/18/24`
</h3>

> [!CAUTION]
> Fast Flags are extremely powerful, being that they are intended to only be used by Roblox engineers. While they can be very useful, they can cause issues with stability and functionality if you don't know what you're doing.


#### Update Logs:
* `Released`

<h1 align="center">Community Presets</h1>

###### NOTE: RESULTS MAY VARY BASED ON THE GAME AND DEVICE SPECS

### Bloxstrap Preset
```json
{
  "FLogNetwork": "7",
  "FFlagFixGraphicsQuality": "True",
  "FIntFullscreenTitleBarTriggerDelayMillis": "3600000",
  "FIntRenderShadowIntensity": "0",
  "DFFlagDisableDPIScale": "True",
  "DFIntTaskSchedulerTargetFps": "5588562",
  "FFlagHandleAltEnterFullscreenManually": "False",
  "FFlagTaskSchedulerLimitTargetFpsTo2402": "False",
  "FFlagGameBasicSettingsFramerateCap5": "False",
  "FIntDebugForceMSAASamples": "1",
  "FFlagDisablePostFx": "True",
  "FIntTerrainArraySliceSize": "0",
  "FFlagDebugGraphicsPreferD3D11": "True"
}
```

### "Da Hood" Preset (w/o Vulkan)
```json
{
  "FLogNetwork": "7",
  "FFlagFixGraphicsQuality": "True",
  "FIntFullscreenTitleBarTriggerDelayMillis": "3600000",
  "FIntRenderShadowIntensity": "0",
  "DFFlagDisableDPIScale": "True",
  "DFIntTaskSchedulerTargetFps": "5588562",
  "FFlagHandleAltEnterFullscreenManually": "False",
  "FFlagTaskSchedulerLimitTargetFpsTo2402": "False",
  "FFlagGameBasicSettingsFramerateCap5": "False",
  "FIntDebugForceMSAASamples": "1",
  "FFlagDisablePostFx": "True",
  "FIntTerrainArraySliceSize": "0",
  "FFlagDebugGraphicsPreferVulkan": "True",
  "FFlagDebugGraphicsPreferD3D11": "True",
  "DFFlagDebugPauseVoxelizer": "True",
  "FIntRenderShadowIntensity": "0",
  "DFFlagDebugSkipMeshVoxelizer": "True",
  "FFlagDebugSkyGray": "True",
  "FFlagRenderFixFog": "True"
}
```

### "Da Hood" Preset (w/ Vulkan)
###### NOTE: THIS MAY BE BUGGY
```json
{
  "FLogNetwork": "7",
  "FFlagFixGraphicsQuality": "True",
  "FIntFullscreenTitleBarTriggerDelayMillis": "3600000",
  "FIntRenderShadowIntensity": "0",
  "DFFlagDisableDPIScale": "True",
  "DFIntTaskSchedulerTargetFps": "5588562",
  "FFlagHandleAltEnterFullscreenManually": "False",
  "FFlagTaskSchedulerLimitTargetFpsTo2402": "False",
  "FFlagGameBasicSettingsFramerateCap5": "False",
  "FIntDebugForceMSAASamples": "1",
  "FFlagDisablePostFx": "True",
  "FIntTerrainArraySliceSize": "0",
  "FFlagDebugGraphicsPreferVulkan": "True",
  "FFlagDebugGraphicsDisableDirect3D11": "True",
  "DFFlagDebugRenderForceTechnologyVoxel": "True",
  "DFFlagDebugPauseVoxelizer": "True",
  "FIntRenderShadowIntensity": "0",
  "DFFlagDebugSkipMeshVoxelizer": "True",
  "FFlagDebugSkyGray": "True",
  "FFlagRenderFixFog": "True"
}
```

<h1 align="center">FPS Uncap</h1>

### Disables 240 cap
```json
{
  "DFIntTaskSchedulerTargetFps": "5588562",
  "FFlagTaskSchedulerLimitTargetFpsTo2402": "False",
  "FFlagGameBasicSettingsFramerateCap5": "False"
}
```

<h1 align="center">Rendering APIs</h1>

### Vulkan
###### NOTE: THIS MAY CRASH YOUR GAME
```json
{
  "FFlagDebugGraphicsPreferVulkan": "True",
  "FFlagDebugGraphicsDisableDirect3D11": "True"
}
```

### Direct3D 11

```json
{
  "FFlagDebugGraphicsPreferD3D11": "True"
}
```

<h1 align="center">Graphics</h1>

### Gray Sky
```json
{
  "FFlagDebugSkyGray": "True"
}
```

### Anti-Aliasing
```json
{
  "FIntDebugForceMSAASamples": "1"
}
```

### Preserve rendering quality
```json
{
  "DFFlagDisableDPIScale": "True"
}
```

### Low Render Distance
###### NOTE: THE DISTANCE DEPENDS ON GRAPHICS LEVEL
```json
{
  "DFIntDebugRestrictGCDistance": "1"
}
```

### Low mesh render distance
```json
{
  "DFIntCSGLevelOfDetailSwitchingDistance": "0",
  "DFIntCSGLevelOfDetailSwitchingDistanceL12": "0",
  "DFIntCSGLevelOfDetailSwitchingDistanceL34": "0",
  "DFIntCSGLevelOfDetailSwitchingDistanceL23": "0"
}
```

### Disable realistic grass
```json
{
  "FIntRenderGrassDetailStrands": "0",
  "FIntFRMMinGrassDistance": "0",
  "FIntFRMMaxGrassDistance": "0",
  "FIntRenderGrassHeightScaler": "0"
}
```

<h1 align="center">Textures</h1>

### Low Quality Terrain
```json
{
  "FIntTerrainArraySliceSize": "4"
}
```

<h1 align="center">Lighting</h1>

### Voxel
###### NOTE: THIS MAY INTERFERE WITH YOUR IN-GAME VISUALS
```json
{
  "DFFlagDebugRenderForceTechnologyVoxel": "True",
  "DFFlagDebugPauseVoxelizer": "True"
}
```

### Disable shadow
```json
{
  "FIntRenderShadowIntensity": "0",
  "DFFlagDebugSkipMeshVoxelizer": "True"
}
```

<h1 align="center">Network/Ping</h1>

### MTU
###### NOTE: THIS WILL AFFECT YOUR IN-GAME PING, SET THE VALUE TO YOUR OPTIMAL MTU
```json
{
  "DFIntConnectionMTUSize": "1200"
}
```

### MTU V2
###### From the OG Roblox Client Optimizer
```json
{
  "DFIntRakNetMtuValue1InBytes": "1280",
  "DFIntRakNetMtuValue2InBytes": "1240",
  "DFIntRakNetMtuValue3InBytes": "1200"
}
```
