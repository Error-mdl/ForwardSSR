#ifndef SCREENSPACE_MACROS

	#define SCREENSPACE_MACROS
	
	#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define PARAM_SCREENSPACE_TEXTURE(tex) const Texture2DArray tex, const SamplerState sampler##tex
		#define PASS_SCREENSPACE_TEXTURE(tex) tex, sampler##tex
		#define SAMPLE_SCREENSPACE_TEXTURE_LOD(tex, uv) tex.SampleLevel(sampler##tex, float3((uv).xy, (float)unity_StereoEyeIndex), (uv).w)

		#define SSR_DECLARE_SCREENSPACE_TEX(tex) Texture2DArray tex; SamplerState sampler##tex;
		#define SSR_STRUCT_PASS_SCREENSPACE_TEX(struct, texName, tex) (struct).##texName = tex; (struct).sampler##texName = sampler##tex; 
		#define SSR_PASS_SCREENSPACE_TEX(struct, texName) (struct).##texName, (struct).sampler##texName 
	#else
		#define PARAM_SCREENSPACE_TEXTURE(tex) const sampler2D tex
		#define PASS_SCREENSPACE_TEXTURE(tex) tex
		#define SAMPLE_SCREENSPACE_TEXTURE_LOD(tex, uv) tex2Dlod(tex, float4((uv).xy, 0, (uv).w))

		#define SSR_DECLARE_SCREENSPACE_TEX(tex) sampler2D tex;
		#define SSR_STRUCT_PASS_SCREENSPACE_TEX(struct, texName, tex) (struct).##texName = tex;
		#define SSR_PASS_SCREENSPACE_TEX(struct, texName) (struct).##texName
	#endif

	#if !defined(UNITY_STEREO_INSTANCING_ENABLED) && !defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#undef SAMPLE_DEPTH_TEXTURE_LOD
		#define SAMPLE_DEPTH_TEXTURE_LOD(tex, uv) tex.SampleLevel(sampler##tex, (uv).xy, (uv).w).r
		SamplerState sampler_CameraDepthTexture;
	#endif

#endif