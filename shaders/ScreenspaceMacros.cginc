#ifndef SCREENSPACE_MACROS

	#define SCREENSPACE_MACROS

	#define INPUT_TEXTURE2D_X(tex) tex, sampler##tex
	#define INPUT_TEXTURE2D_X_STRUCT(struct, texName) (struct).##texName, (struct).sampler##texName 

	#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define PARAM_TEXTURE2D_X(tex) const Texture2DArray tex, const SamplerState sampler##tex
	#else
		#define PARAM_TEXTURE2D_X(tex) const Texture2D tex, const SamplerState sampler##tex
	#endif
#endif