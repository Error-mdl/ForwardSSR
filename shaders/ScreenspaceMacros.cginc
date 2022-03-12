#ifndef SCREENSPACE_MACROS

	#define SCREENSPACE_MACROS
	
	#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define PARAM_SCREENSPACE_TEXTURE(tex) const Texture2DArray tex, const SamplerState sampler##tex
		#define PASS_SCREENSPACE_TEXTURE(tex) tex, sampler##tex
		#define SAMPLE_SCREENSPACE_TEXTURE_LOD(tex, uv) tex.SampleLevel(sampler##tex, float3((uv).xy, (float)unity_StereoEyeIndex), (uv).w)
	#else
		#define PARAM_SCREENSPACE_TEXTURE(tex) const sampler2D tex
		#define PASS_SCREENSPACE_TEXTURE(tex) tex
		#define SAMPLE_SCREENSPACE_TEXTURE_LOD(tex, uv) tex2Dlod(tex, float4((uv).xy, 0, (uv).w))
	#endif

#endif