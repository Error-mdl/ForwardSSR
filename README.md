# WARNING
This repo requires the [BiRP to URP shader includes](https://github.com/Error-mdl/URP-ShaderIncludes-For-BiRP). Unity does not support git dependencies, so you must first install the [BiRP to URP shader includes](https://github.com/Error-mdl/URP-ShaderIncludes-For-BiRP) through the unity package manager before using this repo. This repo is not currently a UPM package, install simply by downloading the code and dropping it in your project. This will should change in the future when I get around to fixing it.

# ForwardSSR
A simple implementation of screenspace reflections in forward rendering for Unity's built-in render pipeline developed for use in VRChat. Rather than being a post-processing
effect, this requires that the SSR functions included in this project be included and called by each shader that needs them. See my other water shader repo for an example